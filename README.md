# Terraform
This repository will create a simple EC2 AWS instance using Terraform and using Terraform cloud to manage access keys and enviroment variables.

## Clone:
To clone this repository you will need a valid version of git. <br />
After doing so you can simply... <br /><br />
`git clone https://github.com/WaltonMcD/Terraform.git`
___

## Init:
To initalize your terraform provider and state you will need a proper install of Terraform and after so you can simply...<br /><br />
`terraform init`
___
## Plan:
You may view the execution plan with...<br /><br />
`terraform plan`<br /><br />
This will give you a view as to how terraform has created the best execution plan to create your infastructure and decided if this plan is apropriate to your needs.
___
## Apply:
Provision your infastructure and update your state file with your 
new infastructure.<br /><br />
`terraform apply`<br /><br />
To avoid being prompted to accept changes you may...<br /><br />
`terraform apply --auto-approve`
 

