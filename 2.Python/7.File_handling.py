#OLD method file handling
f=open(filename,mode)
x = open("file.txt", "r")
print(x.read())
x.close()

x = open("file.txt", "a")
for I in range(10,16,1):
    x.write(f'Hello World {I}\n')   
x.close()

#x = open("file.txt", "r+")
#for I in range(10,16,1):
#    x.write(f'Hello World {I}\n')   
#x.close()

#New method of file handling
with open("file.txt","r") as x:
    print(x.read())

with open("file.txt","r") as file:
    for line in file:
        print(line)

with open("file.txt","a") as file:
    for I in range(20,26,1):
        file.write(f'Hello World {I}\n')

#Saving VPC Dict to VPC.json file
import json
import boto3
import os
from dotenv import load_dotenv
ENV_FILE = '.env_dev'
load_dotenv(ENV_FILE)
ec2_client = boto3.client('ec2',region_name=os.getenv('AWS_DEFAULT_REGION'))
vpc_dict = ec2_client.describe_vpcs().get('Vpcs')
with open("VPC.json","a") as file:
    file.write(json.dumps(vpc_dict,indent=2))

with open("VPC.json","r") as file:
    print(file.read())

with open("VPC.json","r") as file:
    print(json.load(file))

with open("AzurePublicIp.json", "r") as file:
    print(json.load(file))
 
with open("AzurePublicIp.json", "r") as file:
    for value in json.load(file).get('values'):
        print(value.get('name'), value.get('properties').get('addressPrefixes'))
        print('*'*50)
 
import re
pattern = re.compile(r'AzureKeyVault.*')
with open("AzurePublicIp.json", "r") as file:
    for value in json.load(file).get('values'):
        if pattern.match(value.get('name')):
            print(value.get('name'))
            print(value.get('properties').get('addressPrefixes'))
            print('*'*50)

import re
pattern = re.compile(r'Storage\.')
with open("AzurePublicIp.json", "r") as file:
    for value in json.load(file).get('values'):
        if pattern.match(value.get('name')):
            print(value.get('name'))
            open("Storage.json","a").write(json.dumps(value.get('name'),indent=2))
            print(value.get('properties').get('addressPrefixes'))
            open("Storage.json","a").write(json.dumps(value.get('properties').get
            ('addressPrefixes'),indent=2))
            print('*'*50)

import re
pattern = re.compile(r'Storage\.')
with open("AzurePublicIp.json", "r") as file:
    for value in json.load(file).get('values'):
        if pattern.match(value.get('name')):
            open("Storage.json","a").write(json.dumps(value.get('properties').
            get('addressPrefixes'),indent=2))
            open("Storage.json","a").write('\n')
            open("Storage.json","a").write(json.dumps(value.get('name'),
            indent=2))
 
with open("AzurePublicIp.json", "r") as file:
    for value in json.load(file).get('values'):
        if value.get('name') == 'AzureKeyVault.UKSouth':
            print(value.get('name'))
            print(value.get('properties').get('addressPrefixes'))
            print('*'*50) 



