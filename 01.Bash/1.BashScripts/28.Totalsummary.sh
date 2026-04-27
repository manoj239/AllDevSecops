for in i in {1..5}
do
echo $i
echo "The value of i is $i"
cp testsever.zip testsever_$i.zip
done

echo "Lets VPC info for region by using arguments"
REGION=$1
set -x -e
echo "Lets Get VPC info for region $REGION..."
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r
vpc_count= $(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" -r)
echo "$REGION has total ${vpc_count} vpcs.."
echo $0
echo $1

#!/bin/bash
echo $@
echo $*
echo "----------------------------------------------------------------"
echo "Testing $@.."
if [ $# -gt 0 ]; then
    echo "You have Provided $# Arguments to this script..."
    for REGION in $@; do
    #for REGION in "$*"; do 
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

#!/bin/bash
rm -rf /tmp/evenlog && rm -rf /tmp/oddlog 
rm -rf /tmp/evenlog && rm -rf /tmp/oddlog
for i in {2..30}; do
	if [ $(($i % 2)) -eq 0 ];then
		echo "$i is even number" >> tmp/evenlog
    else
		echo "$i is odd number" >> tmp/oddlog
	fi
done

a=10
b=3
sum=$((a + b))
diff=$((a - b))
prod=$((a * b))
quot=$((a / b))
mod=$((a % b))
exp=$((a ** b))

#!/bin/bash
while true; do
    read -p " Please enter the name of the user You like to create :" USERNAME
    echo $USERNAME
    EXISTING_USER=$(cat /etc/passwd | grep -i -w $USERNAME | cut -d ":" -f 1)
    if [ "${EXISTING_USER}" = "${USERNAME}" ]; then
        echo "The Username $USERNAME already exists..Use a different one"
    else
        echo "User $USERNAME Dont Exist .Lets Create A New User $USERNAME"
        useradd -m $USERNAME --shell /bin/bash
        SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${SPEC}"
        echo "$USERNAME:$PASSWORD" | sudo chpasswd
        passwd -e $USERNAME
        echo "Login with  $USERNAME with passwd  as $PASSWORD"
    fi
done

#!/bin/bash
for FILE in $(find / -name awscliv2.zip)
do
echo $FILE
mkdir /tmp/date
cp $FILE /tmp/date
DATE=$(date +%s)
mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
ls -al /tmp/date
done