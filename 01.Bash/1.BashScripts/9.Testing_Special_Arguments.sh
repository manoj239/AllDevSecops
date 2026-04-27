#!/bin/bash
echo $@
echo $*
echo "----------------------------------------------------------------"
echo "Testing $@.."
if [ $# -gt 0 ]; then
    echo "You have Provided $# Arguments to this script..."
    for REGION in $@; do
        echo "Lets Get VPC Information for region $REGION..."
        aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
        VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
        echo "$REGION has a total VPC count of ${VPC_COUNT} VPCs..."
    done
else
    REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
    echo "No region Arg Provided . Please provide a valid AWS Region Name as shown below"
    echo "$REGIONS"
fi
echo "------------------------------------------"

echo "Testing $*.."
if [ $# -gt 0 ]; then
    echo "You have Provided $# Arguments to this script..."
    for REGION in $*; do
        echo "Lets Get VPC Information for region $REGION..."
        aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
        VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
        echo "$REGION has a total VPC count of ${VPC_COUNT} VPCs..."
    done
else
    REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
    echo "No region Arg Provided . Please provide a valid AWS Region Name as shown below"
    echo "$REGIONS"
fi
