//Execute terraform commands from environment specific repos like QA,Prod,Dev.

//To initialize terraform

#cd ENVIRONMENT_REPO

#terraform init

//Ensure that script is executed from appropriate workspace. ex: for Openshift-Fresh project of QA environment

#cd QA/

#terraform workspace new Openshift-Fresh

//Set the parameters for particular project in .tfvars file.

//To execute terraform script for openshift

#terraform apply -var-file="openshift.tfvars"

//To execute terraform script for VM

#terraform apply -var-file="vm.tfvars"

//Every workspace will create its own tf.state file which needs to uploaded in gitlab and version controlled. Avoid uploading ".terraform/plugins" while pushing the Terraform_Scripts to gitlab.