#!/bin/bash

SG_ID="sg-0e650f2bdbf72654d"
AMI_ID="ami-0220d79f3f480ecf5"
HOSTED_ZONE="Z0615773238DUFIUSL8RV"
DOMAIN_NAME="nagababu.online"

    for instance in $@ 
    do

        INSTANCE_ID=$(aws ec2 run-instances \
        --image-id $AMI_ID \
        --instance-type t3.micro \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
        --security-group-ids $SG_ID \
        --query "Reservations[].Instances[].PrivateIpAddress" \
        --output text)
    # if [ $instance == "frontend" ]; then
    #     IP=$(aws ec2 describe-instances \
    #     --instance-ids $INSTANCE_ID \
    #     --query 'Reservations[*].Instances[*].PublicIpAddress' \
    #     --output text)
    # else
    #     IP=$(aws ec2 describe-instances \
    #     --instance-ids $INSTANCE_ID \
    #     --query 'Reservations[*].Instances[*].PrivateIpAddress' \
    #     --output text)
    # fi
        # echo "IP Address : $IP"
        sleep 100
        echo "Instance id : $INSTANCE_ID"


    done