#!/bin/bash

#!/bin/bash

log_file="$HOME/haoran/no/log/syncthing-linux.log"
max_lines=10000
current_time=$(date '+%Y-%m-%d %H:%M:%S')

if [ -f "$log_file" ] && [ $(wc -l < "$log_file") -ge $max_lines ]; then
  > "$log_file"
fi

echo "$current_time" >> "$log_file"

