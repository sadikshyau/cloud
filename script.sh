#!/bin/bash
# Simple bash stress test using curl

LB_URL="demo-alb-1297652538.us-east-1.elb.amazonaws.com"
DURATION=20      # 10 minutes
CONCURRENT=50

echo "Starting stress test..."
echo "Target: $LB_URL"
echo "Duration: $DURATION seconds"
echo "Concurrent requests: $CONCURRENT"

END_TIME=$((SECONDS + DURATION))

while [ $SECONDS -lt $END_TIME ]; do
    for i in $(seq 1 $CONCURRENT); do
        curl -s "$LB_URL" > /dev/null &
    done
    sleep 0.1
done

wait
echo "Stress test completed!"