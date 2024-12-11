------------农历转换函数--------------

local function chinese_weekday(wday)
  wday_num = tonumber(wday) + 1
  chinese_weekdays = {"周日", "周一", "周二", "周三", "周四", "周五", "周六"}
  return chinese_weekdays[wday_num]
end

local function chinese_weekday2(wday)
  wday_num = tonumber(wday) + 1
  chinese_weekdays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"}
  return chinese_weekdays[wday_num]
end

local GetLunarSichen = function(time, t)
  local time = tonumber(time)
  local LunarSichen = {"子时(夜半｜三更)", "丑时(鸡鸣｜四更)", "寅时(平旦｜五更)",
                       "卯时(日出)", "辰时(食时)", "巳时(隅中)", "午时(日中)", "未时(日昳)",
                       "申时(哺时)", "酉时(日入)", "戌时(黄昏｜一更)", "亥时(人定｜二更)"}
  if tonumber(t) == 1 then
    sj = math.floor((time + 1) / 2) + 1
  elseif tonumber(t) == 0 then
    sj = math.floor((time + 13) / 2) + 1
  end
  if sj > 12 then
    return LunarSichen[sj - 12]
  else
    return LunarSichen[sj]
  end
end

------------农历转换函数结束--------------

--[[
	--%a 星期简称，如Wed	%A 星期全称，如Wednesday
	--%b 月份简称，如Sep	%B 月份全称，如September
	--%c 日期时间格式 (e.g., 09/16/98 23:48:10)
	--%d 一个月的第几天 [01-31]	%j 一年的第几天
	--%H 24小时制 [00-23]	%I 12小时制 [01-12]
	--%M 分钟 [00-59]	%m 月份 (09) [01-12]
	--%p 上午/下午 (pm or am)
	--%S 秒 (10) [00-61]
	--%w 星期的第几天 [0-6 = Sunday-Saturday]	%W 一年的第几周
	--%x 日期格式 (e.g., 09/16/98)	%X 时间格式 (e.g., 23:48:10)
	--%Y 年份全称 (1998)	%y 年份简称 [00-99]
	--%% 百分号
	--os.date() 把时间戳转化成可显示的时间字符串
	--os.time ([table])
--]]

local format_Time = function()
  if os.date("%p") == "AM" then
    return "上午"
  else
    return "下午"
  end
end

function CnDate_translator(y)
  local t, cstr, t2
  cstr = {"〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"}
  t = ""
  for i = 1, y.len(y) do
    t2 = cstr[tonumber(y.sub(y, i, i)) + 1]
    if i == 5 and t2 ~= "〇" then
      t2 = "年十"
    elseif i == 5 and t2 == "〇" then
      t2 = "年"
    end
    if i == 6 and t2 ~= "〇" then
      t2 = t2 .. "月"
    elseif i == 6 and t2 == "〇" then
      t2 = "月"
    end
    -- if t.sub(t,t.len(t)-1)=="年" then t2=t2 .. "月" end
    if i == 7 and tonumber(y.sub(y, 7, 7)) > 1 then
      t2 = t2 .. "十"
    elseif i == 7 and t2 == "〇" then
      t2 = ""
    elseif i == 7 and tonumber(y.sub(y, 7, 7)) == 1 then
      t2 = "十"
    end
    if i == 8 and t2 ~= "〇" then
      t2 = t2 .. "日"
    elseif i == 8 and t2 == "〇" then
      t2 = "日"
    end
    t = t .. t2
  end
  return t
end

-- 年天数判断
function IsLeap(y)
  local year = tonumber(y)
  if math.floor(year % 400) ~= 0 and math.floor(year % 4) == 0 or math.floor(year % 400) == 0 then
    return 366
  else
    return 365
  end
end

local function translator(input, seg)
  if input == "/date" then
    num_year = os.date("%j/") .. IsLeap(os.date("%Y"))

    -- 240219
    date = os.date("%y%m%d")
    candidate = Candidate("date", seg.start, seg._end, date, num_year)
    yield(candidate)

    -- 2024.02.19
    date = os.date("%Y.%m.%d")
    candidate = Candidate("date", seg.start, seg._end, date, num_year)
    yield(candidate)

    -- 2024-02-19
    date = os.date("%Y-%m-%d")
    candidate = Candidate("date", seg.start, seg._end, date, num_year)
    yield(candidate)

    -- 2024年02月19日
    date = os.date("%Y年%m月%d日")
    candidate = Candidate("date", seg.start, seg._end, date, num_year)
    yield(candidate)

    -- Feb 19, 2024
    date = os.date("%Y.%m.%d")
    candidate = Candidate("date", seg.start, seg._end, string.gsub(os.date("%b %d, %Y"), "([^%d])0+", "%1"), num_year)
    yield(candidate)

    -- 2/19/2024
    date = string.gsub(os.date("%m/%d/%Y"), "([^%d])0+", "%1")
    date = string.gsub(date, "^0+", "")
    candidate = Candidate("date", seg.start, seg._end, date, num_year)
    yield(candidate)

    -- 二〇二四年二月十九日
    date = CnDate_translator(os.date("%Y%m%d"))
    candidate = Candidate("date", seg.start, seg._end, date, num_year)
    yield(candidate)

  elseif input == "/time" then
    time_discrpt = GetLunarSichen(os.date("%H"), 1)

    time = string.gsub(os.date("%H:%M:%S"), "", "")
    candidate = Candidate("time", seg.start, seg._end, time, time_discrpt)
    yield(candidate)

    time = string.gsub(os.date("%H:%M"), "", "")
    candidate = Candidate("time", seg.start, seg._end, time, time_discrpt)
    yield(candidate)

    time = string.gsub(os.date("%H点%M分%S秒"), "^0", "")
    candidate = Candidate("time", seg.start, seg._end, time, time_discrpt)
    yield(candidate)

    time = format_Time() .. string.gsub(os.date("%I:%M"), "", "")
    candidate = Candidate("time", seg.start, seg._end, time, time_discrpt)
    yield(candidate)

  elseif input == "/week" then
    num_weekday = os.date("第%W周")

    weekday = os.date("%A")
    candidate = Candidate("xq", seg.start, seg._end, weekday, num_weekday)
    yield(candidate)

    weekday = os.date("%a")
    candidate = Candidate("xq", seg.start, seg._end, weekday, num_weekday)
    yield(candidate)

    weekday = chinese_weekday2(os.date("%w"))
    candidate = Candidate("xq", seg.start, seg._end, weekday, num_weekday)
    yield(candidate)

    weekday = chinese_weekday(os.date("%w"))
    candidate = Candidate("xq", seg.start, seg._end, weekday, num_weekday)
    yield(candidate)
  end -- if
end -- function

return translator
