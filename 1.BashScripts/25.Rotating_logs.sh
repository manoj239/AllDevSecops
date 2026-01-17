#!/bin/bash
set +x

# File path for log rotation
#f=/var/log/nginx/access.log
read -p "Enter The File Path(Eg:/var/log/nginx/access.log): " f

if [ ! -f $f ]; then
    echo "$f does not exist!"
    exit
fi

#touch ${f}
MAXSIZE=$((10 * 1024))

# Get the actual file size
size=$(du -b ${f} | tr -s '\t' ' ' | cut -d ' ' -f1)

# Check if file size exceeds the limit
if [ ${size} -gt ${MAXSIZE} ]; then 
    echo Rotating!

    # Create timestamp
    timestamp=$(date +%s)
    # Rename the log file with timestamp
    mv ${f} ${f}.$timestamp
    aws s3 cp ${f}.$timestamp s3://genrelpu/${f}.$timestamp
    # Create a new empty log file
    touch $f
else
    echo "The file '$f' size is ${size} which is less than 10MB. No need to rotate."
fi
