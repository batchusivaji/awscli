#!/bin/bash

aws ec2 describe-instances --filters "Name=tag:Env,Values=QAT" --query "Reservations[].Instances[].InstanceId" --output text

aws ec2 modify-instance-attribute --instance-id ${instanceIds}