#!/bin/bash

# watch -n 5 -d ip -s link show eth0

last_bytes=0 last_packets=0 last_errors=0 last_dropped=0 last_overrun=0 last_collsns=0

while true; do
    output=$(ip -s link show eth0 | head -n 4 | tail -n 1)

    curr_bytes=$(echo "$output"   | awk '{print $1}')
    curr_packets=$(echo "$output" | awk '{print $2}')
    curr_errors=$(echo "$output"  | awk '{print $3}')
    curr_dropped=$(echo "$output" | awk '{print $4}')
    curr_overrun=$(echo "$output" | awk '{print $5}')
    curr_collsns=$(echo "$output" | awk '{print $6}')

    bytes=$(($curr_bytes     - $last_bytes))
    packets=$(($curr_packets - $last_packets))
    errors=$(($curr_errors   - $last_errors))
    dropped=$(($curr_dropped - $last_dropped))
    overrun=$(($curr_overrun - $last_overrun))
    collsns=$(($curr_collsns - $last_collsns))

    last_bytes=$curr_bytes
    last_packets=$curr_packets
    last_errors=$curr_errors
    last_dropped=$curr_dropped
    last_overrun=$curr_overrun
    last_collsns=$curr_collsns

    echo -e 'bytes\tpackets\terrors\tdropped\toverrun\tmcast' >> nic_traffic_packages.sh.txt
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' $bytes $packets $errors $dropped $overrun $collsns >> nic_traffic_packages.sh.txt
    sleep 10
done



##########################################################
### monitor_traffic.service
#
# [Unit]
# Description=Monitor Traffic
#
# [Service]
# ExecStart=/home/haoran/scripts/NIC_traffic_packages.sh
# Restart=always
#
# [Install]
# WantedBy=multi-user.target
#
##########################################################
#
#
# sudo systemctl start your_script
