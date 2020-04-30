# CS latencies

Scripts to measure the latency to several Counter-Strike 1.6 servers.

It can be made to run with any list of IP addresses, just by changing `output.txt`.

## Run

```bash
./cs-latency.sh
```

It sends 10 packets to measure the latency (RTT) and prints the mean. If it's greater than 400ms then it just prints a big number.

It runs in Linux and needs Python 3.

## Get the server list

This was already done. But, the server list was saved to `output.json` obtained with:

```bash
scrapy runspider myspider.py -o output.json
```

Then, it was converted to `output.txt` with:

```bash
jq -r '.[] | .ip' output.json > output.txt
```

These commands need [Scrapy](https://scrapy.org/) and `jq`.
