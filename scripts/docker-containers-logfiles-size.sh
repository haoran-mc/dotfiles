#!/bin/sh
echo "======== docker containers logs file size ========"

logfiles=$(find /var/lib/docker/containers/ -name *-json.log)

# 初始化一个空数组来存储文件信息
logfiles_info=()

for logfile in $logfiles
do
    # 获取文件的详细信息，不使用-h选项以便于排序
    logfile_info=$(ls -l "$logfile")
    # 将获取到的文件信息追加到数组中
    logfiles_info+=("$logfile_info")
done

# 使用sort命令对数组进行排序，基于文件大小（第五列）
# 注意：这里使用的是临时文件，因为Bash数组不能直接通过管道排序
tmpfile=$(mktemp)
for info in "${logfiles_info[@]}"
do
    echo "$info"
done > "$tmpfile"

# 按文件大小排序，然后打印结果
# '-k 5'意味着按第五列（文件大小）进行数值排序
sort -k 5 -r -n "$tmpfile" | while IFS= read -r line; do
    echo "$line"
done

# 删除临时文件
rm "$tmpfile"
