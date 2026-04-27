#!/bin/bash
Get_VPC() {
    echo "Running the function To list VPCs in $1"
    vpc_list=$(aws ec2 describe-vpcs --region $1 | jq .Vpcs[].VpcId -r)
    echo $vpc_list
}

for REG in $@; do
    Get_VPC $REG
done
