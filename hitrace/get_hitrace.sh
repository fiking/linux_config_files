#!/bin/zsh

hdc shell "echo 1 > /sys/kernel/tracing/events/sched/enable"
hdc shell "echo 1 > /sys/kernel/tracing/events/power/enable"

hdc shell "bytrace -b 152400 -t 10 -o /data/log/ws.trace ability distributeddatamgr multimodalinput ohos ace app ark graphic irq rpc sync freq idle samgr sched window zcamera zaudio zimage zmedia binder nweb memory misc ffrt"

hdc shell "echo 0 > /sys/kernel/tracing/events/sched/enable"
hdc shell "echo 0 > /sys/kernel/tracing/events/power/enable"

hdc file recv /data/log/ws.trace

time=$(date "+%Y%m%d-%H%M%S")
mv ws.trace ${time}.trace
