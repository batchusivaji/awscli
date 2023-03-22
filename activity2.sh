#!/bin/bash

aws ec2 describe-instances --filters "Name=tag:Env,Values=QAT" --instance-id ""

aws ec2 modify-instance-attribute --instance-id ${instanceIds}