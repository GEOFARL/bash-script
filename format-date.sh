#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <date>"
    exit 1
fi

# Convert the date to the desired format (yyyy-mm-dd)
input_date="$1"
# Convert the month abbreviation to numerical value

case ${input_date:3:3} in
"Jan") month=01 ;;
"Feb") month=02 ;;
"Mar") month=03 ;;
"Apr") month=04 ;;
"May") month=05 ;;
"Jun") month=06 ;;
"Jul") month=07 ;;
"Aug") month=08 ;;
"Sep") month=09 ;;
"Oct") month=10 ;;
"Nov") month=11 ;;
"Dec") month=12 ;;
*)
    echo "Invalid month abbreviation"
    exit
    ;;
esac

# Rearrange the date components in the desired order
year=${input_date:7:4}
day=${input_date:0:2}

# Combine the date components with hyphens
output_date="${year}-${month}-${day}"

echo $output_date
