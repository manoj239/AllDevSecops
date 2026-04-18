#!/bin/bash
set -x -e  #Enable Debug
REGION1=$1
REGION2=$2
REGION3=$3
echo "$0"
echo "$1"
echo "$2"
echo "$3"
echo "Lets Get VPC Information for region $REGION1..."
aws ec2 describe-vpcs --region $REGION1 | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION1 | jq ".Vpcs[].VpcId" -r | wc -l)
echo "$REGION1" has a total VPC count of ${VPC_COUNT} VPCs..."
echo "##############################################################################"
echo "Lets Get VPC Information for region $REGION2..."
aws ec2 describe-vpcs --region $REGION2 | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION2 | jq ".Vpcs[].VpcId" -r | wc -l)
echo "$REGION2" has a total VPC count of ${VPC_COUNT} VPCs..."
echo "##############################################################################"
echo "Lets Get VPC Information for region $REGION3..."
aws ec2 describe-vpcs --region $REGION3 | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION3 | jq ".Vpcs[].VpcId" -r | wc -l)
echo "$REGION3" has a total VPC count of ${VPC_COUNT} VPCs..."
echo "##############################################################################"