#!/bin/bash
function demofunc1 {
    echo "Welcome to Demo Function1 "
}

demofunc2() {
    echo "Welcome To Demo Function 2"
}

demofunc1
demofunc2

Get_VPC() {
    echo "Running the function To list VPCs in $1"
    vpc_list=$(aws ec2 describe-vpcs --region $1 | jq .Vpcs[].VpcId -r)
    for vpc in $(echo $vpc_list); do
        echo "The VPC ID is:$vpc"
        echo "======================"
    done
}

for REG in $@; do
    Get_VPC $REG
done
