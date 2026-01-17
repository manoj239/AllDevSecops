#!bin/bash
#set -x
#default value ti use if none specified
PERCENT=30
if [[ $# -le 0 ]]; then
    printf "Use default value of ${PERCENT} for threshold.\n"
#test if argument is an integer
#if it is , use that as percent , if not use default
else
    if [ $1 -le 100 -a $1 -gt 0 ]; then
        PERCENT=$1
    else
        echo "INVALID INPUT Value . The Threshold value Must be Between 0 to 100"
        exit 1
    fi
fi

#let percent +=0"
#printf "Threshold = %d\n" $PERCENT
echo "Threshold = $PERCENT"
df -Ph | grep -i root | awk '{ print $5,$1 }' | while read data; do
    usedspace=$(echo $data | awk '{print $1}' | sed s/%//g)
    partition=$(echo $data | awk '{print $2}')
    if [ $usedspace -ge $PERCENT ]; then
        echo "WARNING: The partition \"$partition\" has used $usedspace% of total available space and above threshold of
     $PERCENT  -Date: $(date)"
    else
        echo "Your disk space of \"$partition\" is well below the threshold of $PERCENT and current utilization 
     is $usedspace% ."
    fi
done
