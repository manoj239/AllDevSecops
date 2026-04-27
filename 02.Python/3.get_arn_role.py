import boto3
from dotenv import load_dotenv
#load_dotenv('.env_dev')
import os
# Load environment variables from the specified file
ENV_FILE = '.env_dev'
load_dotenv(ENV_FILE)

# Print AWS credentials and region to verify they are loaded correctly
print(os.getenv('AWS_ACCESS_KEY_ID'))
print(os.getenv('AWS_SECRET_ACCESS_KEY'))
print(os.getenv('AWS_DEFAULT_REGION'))

iam_client = boto3.client('iam',region_name=os.getenv('AWS_DEFAULT_REGION'))
roles = iam_client.list_roles().get('Roles')    
print(type(roles))
print(len(roles))
# Print ARNs of roles that match the specified prefixes
for role in roles:
    role_name = role.get('Arn').split('/')[1]
    if role_name.startswith('awsb24') or role_name.startswith('AWSB24'): 
        print(role.get('Arn'))
#List Comprehension For Matched Role ARNs
aws_roles = [role.get('Arn') for role in roles if role.get('Arn').split('/')[1].
startswith('awsb24') or role.get('Arn').split('/')[1].startswith('AWSB24')]
print(aws_roles)
print('------------------------------------------------------------')
# Print attached policies for matched roles
for arn in aws_roles:
    print(arn.split('/')[1])
    print(iam_client.list_attached_role_policies(RoleName=arn.split('/')[1]).get('AttachedPolicies'))
    print('--------------------------------')
    # Uncomment the following lines to remove roles from instance profiles and delete roles
    # iam_client.remove_role_from_instance_profile(InstanceProfileName=arn.split('/')[1],
    # RoleName-arn.split('/')[1])
    # iam_client.delete_role(RoleName=arn.split('/')[1])