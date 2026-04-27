#!/bin/bash
DOMAIN=$@
if [ $# -gt 0 ]; then
    for WEBSITE in $DOMAIN; do
        timeout 3 netcat -zv $WEBSITE 443 >>/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "The sever $WEBSITE is up and running"
        else
            echo "The sever $WEBSITE is down or Invalid domian."
            #break
            continue
        fi
    done
else
    echo "Please provide the Domain name or server IP address to check the Server status"
fi
