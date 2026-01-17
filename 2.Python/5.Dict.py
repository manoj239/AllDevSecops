import boto3
from dotenv import load_dotenv
#load_dotenv('.env_dev')
import os
# Load environment variables from the specified file
ENV_FILE = '.env_dev'
load_dotenv(ENV_FILE)
ec2_client = boto3.client('ec2',region_name=os.getenv('AWS_DEFAULT_REGION'))
print(ec2_client.describe_vpcs())
print(ec2_client.describe_vpcs().keys())
print(ec2_client.describe_vpcs().get('Vpcs'))
print(ec2_client.describe_vpcs()['Vpcs'])

#Loop through the VPCs
for vpc in ec2_client.describe_vpcs().get('Vpcs'):
    print(vpc.get('VpcId'),'----->',vpc.get('CidrBlock'))
    print('---------------')
