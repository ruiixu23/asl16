#!/usr/bin/env bash

source ./scripts/utils/print-header.sh

num_servers=$1
replication_factor=$2
write_percent=$3

log_dir=./logs/write/server-${num_servers}-replication-${replication_factor}-write-${write_percent}
cat ${log_dir}/*client*.log | grep  "Global   60" | awk 'NR % 2 == 0'
echo
cat ${log_dir}/*client*.log | grep  "Global   60" | awk 'NR % 2 == 0' | wc
echo
ls -l ${log_dir} | wc
cat ${log_dir}/*bash*.log | grep "Wait timeout"
cat ${log_dir}/*bash*.log | grep "FAILURE"
cat ${log_dir}/*error*.log
echo
