#!/bin/bash
DATA=$(cat applist.log)
echo $DATA
for  URL in $DATA
do
if [[ "$URL" =~ ^https?://([^/]+) ]]; then
    domain=${BASH_REMATCH[1]}
    echo "$URL is a valid URL and domian name is $domain ."
else
    echo "$URL is invalid URL as it is not starting with http or https."
fi
done

#? (question mark ): Makes the preceding character optional, macthing zero or 
#one occurence . Means before ? it should be s or empty

#https://kodekloud.com/blog/regex-shell-script/
#BASH_REMATCH[0] = https://
#$BASH REMATCH[1] = www.google.com  
#$BASH REMATCH[2] = .