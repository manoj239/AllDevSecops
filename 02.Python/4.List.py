import boto3
from dotenv import  load_dotenv
import os
ENV_FILE = '.env_dev'
load_dotenv(ENV_FILE)
# Check if the environment variable is loaded
print(os.getenv('AWS_DEFAULT_REGION'))
#ec2_client = boto3.client('ec2',region_name=os.getenv('AWS_DEFAULT_REGION'))
ec2_client = boto3.client('ec2',region_name='ap-south-1')
#print(ec2_client.describe_regions())
regions_list = []
for region in ec2_client.describe_regions().get('Regions'):
    regions_list.append(region.get('RegionName'))
print(regions_list)

#Using list comphrension

comp_list= [ region['RegionName'] for region in ec2_client.describe_regions().get
('Regions')]


#Search for the roles that start with 'awsb24' or 'AWSB24'
iam_client = boto3.client('iam',region_name=os.getenv('AWS_DEFAULT_REGION'))
roles = iam_client.list_roles().get('Roles')
print(type(roles))  
print(len(roles))
#Using list comprehension For Roles list
role_names = [role.get('Arn').split('/')[1] for role in roles if role.get('Arn').split('/')[1].startswith('awsb24') or role.get('Arn').split('/')[1].startswith('AWSB24')]

for role in role_names:
    policies = iam_client.list_attached_role_policies(RoleName=role).get
    ('AttachedPolicies')
    print(policies)
    for policy in policies:
        print(policy['PolicyName'])
        iam_client.detach_role_policy(RoleName=role,PolicyArn=policy['PolicyArn'])

aws_roles = [role.get('Arn') for role in roles if role.get('Arn').split('/')[1].
startswith('awsb26') or role.get('Arn').split('/')[1].startswith('AWSB26')]
print(aws_roles)
print('-------------------------------------------------')
for arn in aws_roles:
    print(arn.split('/')[1])
    print(iam_client.list_attached_role_policies(RoleName=arn.split('/')[1]).get
    ('AttachedPolicies'))
    print('----------------------------------------------')
    iam_client.remove_role_from_instance_profile(InstanceProfileName=arn.split('/')[1],
    RoleName=arn.split('/')[1])
    deleted_role = iam_client.delete_role(RoleName=arn.split('/')[1])
    print(f'Deleted {deleted_role}')


