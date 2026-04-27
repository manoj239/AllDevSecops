#!/bin/bash
 
# Download Logs Locally For Year 2024
aws s3 sync s3://awsb64logs/ALBlogs/AWSLogs/721834156908/elasticloadbalancing/us-east-1/2024/ /tmp/logs
 
# Find files which are ending with .gz and unzip them
for FILE in $(find /tmp/logs -name "*.gz"); do
    gunzip $FILE
done
 
# Use find to go through log and find the entries with IP 44.197.113.124
find /tmp/logs -type f -name "*.log" -exec grep '44.197.113.124' {} \;

for file in $(find /tmp/logs -type f -name "*.log")
do
echo $file
echo "----------------"
cat $file | grep '44.197.113.124'
done