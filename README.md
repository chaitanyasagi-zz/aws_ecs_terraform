# aws_ecs_terraform

terraform init

terraform plan -var-file=env/test.tfvars -out outfile

terraform apply "outfile

terraform destroy -var-file=env/test.tfvars

Testing: Verify the Nginx default page using the ALB DNS
