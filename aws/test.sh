set -euo pipefail
#change directory to project dir
cd /home/nimap/uday/terraform/aws

#create resource
terraform init
terraform apply -auto-approve

#wait for some for resource crestion
sleep 100

#query the output , extract the content and make a request
terraform output -json | \
#jq -r '..filename' |\
jq -r '.instance_ip_addr.value'|\
xargs -I {} curl http://{}:8080 -m 10

#if request is succeed ,then destroy the resource
terraform destroy -auto-approve 