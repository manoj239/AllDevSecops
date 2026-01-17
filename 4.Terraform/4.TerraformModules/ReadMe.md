To Generate User Token: Dont Create Org Token
https://app.terraform.io/app/<orgname>/settings/authentication-tokens

Even Though we use TFE backend, still we need to give AWS Creds Variables in TFE:
AWS_ACCESS_KEY_ID=<>
AWS_SECRET_ACCESS_KEY<>

TF_TOEN ENV Variable:
export TF_TOKEN_app_terraform_io=<token>
$Env:TF_TOKEN_app_terraform_io=<token>
$Env:TF_TOKEN_app_terraform_io=
credentials "app.terraform.io" {
  # valid user API token
  token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
}

#Creating GitHub Repo using Commandline
https://github.com/cli/cli/releases/tag/v2.37.0
gh auth login
gh repo create terraform-aws-devsecopsb42-network --private
gh repo create terraform-aws-devsecopsb42-sg --private
gh repo create terraform-aws-devsecopsb42-nat --private
gh repo create terraform-aws-devsecopsb42-iam --private
gh repo create terraform-aws-devsecopsb42-compute  --private
gh repo create terraform-aws-devsecopsb42-elb-alb --private
gh repo create terraform-aws-devsecopsb42-elb-nlb --private
gh repo create terraform-aws-devsecopsb42-route53 --private
gh repo create terraform-aws-devsecopsb42-secrets-manager --private
gh repo create terraform-aws-devsecopsb42-rds --private
gh repo create terraform-aws-devsecopsb42-s3 --private
gh repo create devsecopsb42-terraform-enterprise-alpha --private
gh repo create devsecopsb42-terraform-enterprise-bravo --private

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-network
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-sg.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-nat.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-iam.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-compute.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-elb-alb.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-elb-nlb.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-route53.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-secrets-manager.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-rds.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/terraform-aws-devsecopsb42-s3.git
git push origin master
git tag v1.0.0
git push origin v1.0.0

# ####################################################### 
git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/devsecopsb42-terraform-enterprise-alpha.git
git push origin master


git init
git add .; git commit -m "Terraform Module Code"
git remote add origin git@github.com:SreeVeerDevOps/devsecopsb42-terraform-enterprise-bravo.git
git push origin master

