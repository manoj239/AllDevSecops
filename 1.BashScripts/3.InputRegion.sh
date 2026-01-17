
# In below statements $1 can be called as argument or Parameter  which is passed to the script
REGION=$1
echo "Lets Get VPC Information for region $REGION..."
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
VPC_COUNT=$(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r | wc -l)
echo $VPC_COUNT
echo ${VPC_COUNT}
echo "${VPC_COUNT}"
echo "$REGION has a total VPC count of ${VPC_COUNT} VPC's"
echo "$0"
echo "$1"

#Execution syntax bash 3.InputRegion.sh <region-name>
