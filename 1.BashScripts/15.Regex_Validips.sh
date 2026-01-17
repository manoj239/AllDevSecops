#!/bin/bash
DATA=$(cat Iplist.log)
for IPADDRESS in $DATA; do
    if [[ $IPADDRESS =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$IPADDRESS is valid"
    else
        echo "$IPADDRESS is Invalid"
    fi
done
