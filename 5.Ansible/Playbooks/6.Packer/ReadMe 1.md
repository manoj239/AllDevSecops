$Env:AWS_ACCESS_KEY_ID=''
$Env:AWS_SECRET_ACCESS_KEY=''

packer.exe init packer.json.pkr.hcl
packer.exe validate --var-file vars.json packer.json.pkr.hcl
packer.exe inspect --var-file vars.json packer.json.pkr.hcl
packer.exe build --var-file vars.json packer.json.pkr.hcl

User Data:
cd /myrepo/
git pull origin awsb65-packer
ansible-playbook /myrepo/playbook.yaml

# Steps involved in creating custom image in AWS, Azure & GCP
- Create a Server
- Login to the server
- Install all dependencies, packages and softwares.
- Shutdown the machine.
- Create image(AMI) from the machine.
- Delete the machine.