#https://www.w3schools.com/python/python_ref_string.asp

aws_arn = 'arn:aws:iam::442426885544:user/Devops'
print(aws_arn.upper())
print(aws_arn.lower())
print(aws_arn.split())  #=> ['arn:aws:iam::442426885544:user/Devops']
print(aws_arn.split(':')) #=> ['arn', 'aws', 'iam', '', '442426885544', 'user/Devops']
print(aws_arn.split('/')) #=> ['arn:aws:iam::442426885544:user', 'Devops']
print(aws_arn.split('/')[0]) #=> arn:aws:iam::442426885544:user
print(aws_arn.split('/')[1])  #=> Devops
print(aws_arn.replace('aws', 'azure')) #=> arn:azure:iam::442426885544:user/Devops
print(aws_arn.find('aws')) #=> 4
the_list = ['arn' , 'aws' , 'iam' , '442426885544' , 'user' , 'Devops']
print(':'.join(the_list)) #=> 'arn:aws:iam:442426885544:user:Devops')
