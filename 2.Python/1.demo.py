import boto3
REGION = input("Please enter the Region: ")
print(type(REGION))
client = boto3.client('ec2',region_name=REGION)
vpc_list = client.describe_vpcs()
print(vpc_list)