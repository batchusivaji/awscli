#!/bin/bash

instanceIds=$(aws ec2 describe-instances --filter "Name=tag:Env,Values=QA" "Name=instance-state-name,Values=running" --query Reservations[].Instances[].InstanceId --output text)
if [[ -n $"instanceIds"]]; then
echo "the instace ids which will be shutdown are {instancesIds}"
aws ec2 stop-instances --instance-ids ${instanceIds}
else
echo "no instanes found mathins criteria Env=QA"
fi
