#!/bin/bash

touch flux.txt

while true; do
  echo "$(date): Top 10 memory consuming processes" >> flux.txt
  
  ps aux --sort=-%mem | head -5 >> flux.txt
  
  echo "----------------------------------------" >> flux.txt
  
  sleep 20
done
