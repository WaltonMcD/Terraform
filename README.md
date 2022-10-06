# Terraform
This repository will utilize multiple providers to create computing architecture such as a EC2 AWS instance, Azure instance, while also using kubernetes and docker with Terraform. The AWS_Getting-Started takes advantage of Terraform's ability to manage state remotely using Terraform cloud to manage access keys and environment variables.

You will need to create an account in Terraform Cloud which can be found here -> https://app.terraform.io/session.
Once you have created an account you will need to provide your AWS access keys as environment variables.

## Clone:
To clone this repository you will need a valid version of git. <br />
After doing so you can simply... <br /><br />
`git clone https://github.com/WaltonMcD/Terraform.git`
___

## Init:
To initialize your terraform provider and state you will need a proper install of Terraform and after so you can simply...<br /><br />
`terraform init`
___
## Plan:
You may view the execution plan with...<br /><br />
`terraform plan`<br /><br />
This will give you a view as to how terraform has created the best execution plan to create your infrastructure and decided if this plan is appropriate to your needs.
___
## Apply:
Provision your infrastructure and update your state file with your 
new infrastructure.<br /><br />
`terraform apply`<br /><br />
To avoid being prompted to accept changes you may...<br /><br />
`terraform apply --auto-approve`
___
## Destroy
Its important to review a destroy before conducting one. you may do so as such...<br /><br />
`terraform plan -destroy`<br /><br /> 
This will allow the destruction plan to be reviewed. If the plan is correct you can destroy your infrastructure as such...<br /><br />
`terraform destroy`<br /><br />
To avoid being prompted to accept destruction you may...<br /><br />
`terraform destroy --auto-approve`

