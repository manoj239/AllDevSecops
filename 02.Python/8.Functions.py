def demo():
    print("Hello World")
 
demo()

#passig one argument
 
def demo(a):
    for i in range(a):
        print(f'Hello World {i}')

demo(10)
#checking regions
import boto3
def check_aws_region(reg):
    ec2_client = boto3.client('ec2', region_name='us-east-1')
    regions = [region['RegionName'] for region in ec2_client.describe_regions().get('Regions')]
    if reg in regions:
        print(f'{reg} is a valid region')
    else:
        print(f'{reg} is not a valid region')


check_aws_region('us-east-1')


#Exception handling

import boto3
from botocore.exceptions import ClientError,InvalidRegionError,EndpointConnectionError
 
regions = ['ap-south-2', 'ap-south-1', 'eu-north-1', 'eu-west-3', 'eu-west-2',
           'eu-west-1', 'ap-northeast-3', 'ap-northeast-2', 'ap-northeast-1',
           'ca-central-1', 'sa-east-1', 'ap-southeast-1', 'ap-southeast-2',
           'eu-central-1', 'us-east-1', 'us-east-2', 'us-west-1', 'us-west-2'] 
def try_check_aws_region(reg):
    try:
        ec2_client = boto3.client('ec2', region_name=reg)
        ec2_client.describe_vpcs().get('Vpcs')
        print(f'The Region {reg} is Valid')
    except ClientError as e:
        print(f'Provide Valid Credentials: {e}')
    except InvalidRegionError as e:
        print(f'The Region Name Given Is Invalid: {e}')
    except EndpointConnectionError as e:
        print(f'The Region Name Given Is Invalid: {e}')
    except UnboundLocalError as e:
        print(f'Error: {e}')
    except Exception as e:
        print(f'Error: {e}')
    finally:
        print(f'The function Execution is complete For region {reg}')

#5 Types of python Function arguments

    Default arguments
    Keyword arguments
    Positional arguments
    Arbitrary Positional arguments
    Arbitrary Keyword arguments

def hello(a,b):
    #print(a,b)
    return a+b

Default arguments
def add(a,b=5,c=10):
    return (a+b+c)

Positional arguments

def position(a,b):
    ec2_client = boto3.client(a,region_name=b)
    print(ec2_client.describe_vpcs().get('Vpcs'))

position('ec2','us-east-1')

Keyword arguments
position(b='us-east-1',a='ec2')

#Arbitrary Positional arguments
def argstesting(*args):
    print(type(args))
    for region in args:
        print(region)


#Arbitrary Keyword arguments

def kwargstesting(**kwargs):
    print(type(kwargs))
    for key,value in kwargs.items():
        print(key,'------->',value)

