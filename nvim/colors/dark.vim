hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='dark'

let s:black           = { "gui": "#000000", "cterm": "232" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243" }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231" }
let s:subtle_black    = { "gui": "#303030", "cterm": "236" }
let s:light_black     = { "gui": "#262626", "cterm": "235" }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239" }
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251" }
let s:pink            = { "gui": "#fb007a", "cterm": "9"   }
let s:light_red       = { "gui": "#E32791", "cterm": "1"   }
let s:dark_blue       = { "gui": "#81A2BE", "cterm": "32"  }  "nerdtree
let s:actual_yellow   = { "gui": "#f0c674", "cterm": "11"  }  "Formming into my dreamtale
let s:dark_green      = { "gui": "#10A778", "cterm": "2"   }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"  }
let s:light_purple    = { "gui": "#a790d5", "cterm": "140" }
let s:yellow          = { "gui": "#F3E430", "cterm": "11"  }
let s:light_yellow    = { "gui": "#ffff87", "cterm": "228" }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"   }

let s:background = &background

let s:bg               = s:black             "背景
let s:bg_subtle        = s:lighter_black     "微妙的背景
let s:bg_very_subtle   = s:subtle_black      "非常微妙的背景
let s:bg_very_subtle_r = s:black             "修改非常微妙的背景
let s:norm             = s:lighter_gray      "规范
let s:norm_subtle      = s:medium_gray       "微妙的规范
let s:purple           = s:light_purple      "紫色
let s:green            = s:light_green       "绿色
let s:red              = s:light_red         "红色
let s:visual           = s:light_purple      "可视
let s:yellow           = s:light_yellow      "黄色

" haoran
let s:red_silver_star_Begonia = { "gui": "#f52443", "cterm": "160" }
let s:green_verdant   = { "gui": "#99f158", "cterm": "46" }


" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
    execute "highlight" a:group
                \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
                \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
                \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
                \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
                \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
                \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
                \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
    execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:purple, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle, "gui": "italic"})

call s:h("Constant",      {"fg": s:purple})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:red_silver_star_Begonia }) "haoran: for while return if
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold", "gui": "bold"})

call s:h("PreProc",     {"fg": s:green_verdant}) "haoran #include
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": "italic"})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",          {"fg": s:purple, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_blue}) "haoran nerdtree
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:light_green, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:purple, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle_r, "fg": s:bg_very_subtle_r})
call s:h("Title",         {"fg": s:actual_yellow})  "haoran Formming into my dreamtale
call s:h("Visual",        {"fg": s:norm, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})

call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
call s:h("SpellCap",    {"cterm": "underline", "fg": s:light_green})
call s:h("SpellRare",   {"cterm": "underline", "fg": s:pink})
call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:purple})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:purple, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})
