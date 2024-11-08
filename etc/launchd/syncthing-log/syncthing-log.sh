#!/bin/bash

log_file="$HOME/haoran/no/log/syncthing-macos.log"
max_lines=10000
current_time=$(date '+%Y-%m-%d %H:%M:%S')

# 如果文件行数超过 max_lines，清空文件
if [ -f "$log_file" ] && [ $(wc -l < "$log_file") -ge $max_lines ]; then
  > "$log_file"
fi

echo "$current_time" >> "$log_file"
