#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <log filename>"
  exit 1
fi
FILENAME=$1

# Extract the number of unique hosts for each date
cat $FILENAME |
  awk '{print substr($4, 2), $1}' |
  awk '{print substr($1, 0, 12), $2}' |
  sort -u |
  awk '{print substr($1, 1, length($1)-1)}' |
  uniq -c |
  sort -rn >unique_hosts.txt

# Calculate the total number of hosts for all dates
# That don't repeat
# total=$(cat $FILENAME | awk '{print $1}' | sort | uniq | wc -l)

# That repeat
total=$(wc -l $FILENAME)

exec 3<"unique_hosts.txt"

# Calculate the percentage of unique hosts
# for each date and output the result
count=0
while read -u 3 line; do
  date=$(./format-date.sh $(echo $line | awk '{print $2}'))
  unique=$(echo $line | awk '{print $1}')

  percentage=$(echo "$unique $total" | awk '{printf "%.2f\n", $1/$2*100}')
  count=$((count + 1))
  echo "$date - $unique - $percentage%"
  if [ $count -eq 10 ]; then
    break
  fi
done <unique_hosts.txt

rm "unique_hosts.txt"
