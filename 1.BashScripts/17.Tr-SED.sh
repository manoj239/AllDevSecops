echo "Welcome to Devsecops" | tr -d 'e' 
echo "Welcome to Devsecops" | tr '[:lower:]' '[:upper:]'
echo "Welcome to Devsecops" | tr '[:upper:]' '[:lower:]'

TR cannot do the following 
1. It works character by character
2. If I want to change a string  in a file at particular loaction , its not possible.
3. If want to change a word/string/charc in the whole file it might be not possible


Steam Edito(SED)
cat /etc/ssh/sshd_config | grep -n -i passwordauthen
57:#PasswordAuthentication yes
79:# PasswordAuthentication.  Depending on your PAM configuration,
83:# PAM authentication, then enable this but set PasswordAuthentication


Changing password authentication to yes on line number 57
sed -i "57 s/.*PasswwordAuthentication.*/PasswwordAuthentication yes/g" /etc/ssh/sshd_config

Dry-Run
sed "57 s/.*PasswwordAuthentication.*/PasswwordAuthentication yes/g" /etc/ssh/sshd_config | grep -n -i PasswwordAuthentication
sed -i "57 s/.*PasswordAuthentication.*/PasswordAuthentication no/" /etc/ssh/sshd_config  | grep -n -i PasswwordAuthentication

cat data | awk -F" " '{print $2}' | tr "-" "."