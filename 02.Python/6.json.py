from faker import Faker
import json
demo = Faker()
demo.profile()


jsondata = open('AzurePublicIp.json','r')
x = json.load(jsondata)
for item in x['values']:
    x = item['name']
    #y = item['id']
    z = item['properties']['addressPrefixes']
    if x.startswith('AzureKeyVault'):
        print(x,y)
jsondata.close()