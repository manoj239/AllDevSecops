uptime
last reboot
uname -a
cat /etc/lsb-release
aws ec2 describe-vpcs --region us-east-1 
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId"
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r | wc -l
echo $vpc_count
echo "$vpc_count"
echo "${vpc_count}"
a=10
echo $a, echo "${a}", echo ${a}
curl ipconfig.io
STDIN-0
STDOUT-1
STDERR-2
echo "Welcome to 4th floor" > /tmp/hir
echo "Welcome to appending" >> /tmp/hir
echo "Welcome to Sridevi" | tee /tmp/teel
echo "Welcome to Drama company" | tee -a /tmp/teel
Program	    | Exit Codes and Their Meaning
systemctl   | 0 = success; 3 = service inactive; 4 = unit not found; etc.
grep	    | 0 = found match; 1 = no match found; 2 = error occurred
source 1.script.sh 1 > /dev/null #errors will print in screen
bash 2.script > /dev/null 2&>1
sudo passwd ubuntu #TO give  the new passoword
sudo passwd -e ubuntu #TO change/expire the passwd
USERNAME="manoj"
PASSWORD="SecurePass123"
echo "$USERNAME:$PASSWORD" | sudo chpasswd #To set the password to the user
find / -name '*.zip' -size +10M -size -100M | xargs du -ch
find / -name '*.zip' -size +10M -size -100M | xargs rm -rf
find / -path  $(pwd) -prune -o name '*.zip' -size 10m -size -100M

