#!/bin/bash

tag_name=$1
tag_value=$2
if [[ -z $"tag_name" ]]; then
    tag_name= "Env"

instanceIds=$(aws ec2 describe-instances --filter "Name=tag:Env,Values=QA" "Name=instance-state-name,Values=running" --query Reservations[].Instances[].InstanceId --output text)
if [[ -n $"instanceIds" ]]; then
echo "the instace ids which will be shutdown are {instancesIds}"
aws ec2 stop-instances --instance-ids ${instanceIds}
else
echo "no instanes found with matching criteria Env = QA"
fi
