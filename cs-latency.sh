#!/usr/bin/env bash

mapfile -t server_ips < output.txt
#server_ips=( '80.72.41.211' '185.113.141.45' '147.135.199.82' )

hops=30

for server_ip in "${server_ips[@]}"; do
    latency=$(traceroute -n -f $hops -m $hops -q 10 -w 0.4 "$server_ip" | grep -oP "(?<=$hops  $server_ip  ).*" | grep -Eo '[0-9]+\.[0-9]+' | python -c '
import sys

nums=[float(l) for l in sys.stdin]

if nums:
    print(sum(nums) / len(nums))
else:
    1000000
    ')
    latency=${latency:-1000000}
    echo $server_ip $latency
done
