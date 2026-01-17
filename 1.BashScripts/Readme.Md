apt update && apt install -y unzip jq net-tools tree

https://releases.hashicorp.com/terraform/1.11.1/terraform_1.11.1_linux_arm64.zip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

curl https://get.docker.com | bash

docker run --rm -d --name appl -p 8000:80 sreeharshav/fastapi:latest

To get what type of OS we are using , give this -->  [unanme -a]

But above above command doesn't give release , so instead give   --> cat /etc/lsb-release

Following tools must be Installed on Ubuntu system

1.Unzip

2.JQ

3.AWS CLI

4.AZ CLI

5.net-tools

6.tree

  >- Redirect output to a file and existing data will be overwritten
  >> - Redirect output to a file and existing data will be appended
  echo "WELCOME TO DEVOPS B43 -ICONSTAR" | tee -a /tmp/tee1 #appending existing data
  echo "WELCOME TO DEVOPS B43 -ICONSTAR" | tee  /tmp/tee1 #Overwritten existing data


 cat /etc/passwd | grep -i -w ubuntu
 cat /etc/passwd | grep -E -w 'ubuntu|ubuntu1'
 cat /tmp/event.log | grep -E -i 'error|denied'

cut command

cat /etc/passwd | grep -i -w ubuntu | cut -d ":" -f 1

X="Devsecops"
echo $x , O/p: Devsecops

echo $#x[@] , O/p:0X[@]

echo ${x[@]} , o/p: Devsecops

echo ${#x}, O/p: 9

GLobal Env VariableS:
echo $HOME
echo $USER
echo $PWD

#aws ec2 describe-volumes --region us-east-1 | jq ".Volumes[].VolumeId" -r, Used to tell the volumes vaiable in the region
#aws ec2 describe-volumes --volume-ids vol-03d5d505e1e543a80 | jq ".Volumes[].Size" -r, Used to tell the size for the volume in the region
#aws ec2 describe-volumes --volume-ids vol-03d5d505e1e543a80 | jq ".Volumes[].State" -r , Used to tell the state of 
of the volume

User Env VariableS:
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=