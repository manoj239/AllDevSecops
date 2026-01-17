#!/bin/bash
#x=Devsecops
#echo $x
#size=${#x}
#echo ${x[@]:0:1}
#echo ${x[@]:2:2}
#STRING_LENGTH=$(expr $size - 1)
#echo $STRING_LENGTH
#-----------

#!/bin/bash

INPUT_STRING=$1
SIZE=${#INPUT_STRING}
STRING_LENGTH=$(expr $SIZE - 1)
REVERSE=''

for (( I=$STRING_LENGTH; I>=0; I-- )); do
    REVERSE=${REVERSE}${INPUT_STRING:$I:1}
done

if [ "$INPUT_STRING" = "$REVERSE" ]; then
    echo "$INPUT_STRING is a palindrome"
else
    echo "$INPUT_STRING is not a palindrome"
fi
