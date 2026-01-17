#Script to Find and print EVEN and ODD numbers
#!/bin/bash
rm -rf /tmp/EVEN.log && rm -rf /tmp/ODD.log
for I in {2..30}; do
    if [ $(expr $I % 2) == 0 ]; then
        echo "I is $I and its a EVEN number" >>/tmp/EVEN.log
    else
        echo  "I is $I and its a ODD number" >>/tmp/ODD.log
    fi
done



#Script to Find and print EVEN and ODD numbers
#!/bin/bash
rm -rf /tmp/EVEN.log && rm -rf /tmp/ODD.log
for I in {2..30}; do
    if [ $(($I % 2)) == 0 ]; then
        echo "I is $I and its a EVEN number" | tee -a /tmp/TEE-EVEN.log
    else
        echo  "I is $I and its a ODD number" | tee -a /tmp/TEE-ODD.log
    fi
done
