#Find file name awscliv2.zip and copy to a diff folder with random number as suffix
#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
    echo $FILE
    mkdir /tmp/demo
    cp $FILE /tmp/demo
    mv /tmp/demo/awscliv2.zip /tmp/demo/awscliv2-${RANDOM}.zip
done

#Find file name awscliv2.zip and copy to a diff folder with ISO date as suffix

#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
    echo $FILE
    #mkdir /tmp/date
    cp $FILE /tmp/date
    DATE=$(date +%s)
    mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
    ls -al /tmp/date
done

#!/bin/bash
#for FILE in $(find / -name awscliv2.zip)
#do
#echo $FILE
#mkdir /tmp/date
#cp $FILE /tmp/date
#DATE=$(date +%s)
#mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
#ls -al /tmp/date
#done

#Find files which are sizes b/w 10 MB and 100MB
find / -name '*.zip' -size +10M -size -100M

#Using Xargs to find the size of files
find / -name '*.zip' -size +10M -size -100M | xargs du -ch

#Delete the files which are sizes b/w 10 MB and 30MB using args
find / -name '*.zip' -size +10M -size -100M | xargs rm -rf





#!/bin/bash
read -p "Enter the minimum Size : " MIN_SIZE
read -p "Enter the maximum Size : " MAX_SIZE
read -p "Enter the path : "  FILE_PATH
find $FILE_PATH -name "*.zip" -size +${MIN_SIZE}M -size -$(MAX_SIZE)M | xargs du -ch



#/bin/bash
find $1 -name "*.zip" -size +${2}M -size -${3}M | xargs du -ch


#Find the files which are modified before 5 days
Find  files  modified more than  7  days ago in the current dirrectory and it subdirectories:
find /etc -mtime +7
find /etc -mtime -3 #Files modified within last 3 days
