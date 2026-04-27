#!/bin/bash
echo "Lets Get VPC Information for region us-east-1..."
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r | wc -l)
echo $VPC_COUNT
echo ${VPC_COUNT}
echo "${VPC_COUNT}"
echo "US-EAST-1 has a total VPC's count of ${VPC_COUNT} VPC's"





#aws ec2 describe-vpcs --region us-east-1
#aws ec2 describe-vpcs --region us-east-1 | jq
#aws ec2 describe-vpcs --region us-east-1 | jq ".Vpc[]"
#aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId
