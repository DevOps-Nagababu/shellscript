    #!/bin/bash


#Create the EC2 Instance and Hosted Zone record and attache the Private IP to Hosted Zone recrod

# Required  AMI ID , Security Group Id ,Hosted Zone ID and Domain Name
    SG_ID="sg-0e650f2bdbf72654d"
    AMI_ID="ami-0220d79f3f480ecf5"
    HOSTED_ZONE="Z0615773238DUFIUSL8RV"
    DOMAIN_NAME="nagababu.online"


        for instance in $@  # MongoDB, Nginx etc...
        do
# Query to get the Instance ID
            INSTANCE_ID=$(aws ec2 run-instances \
            --image-id $AMI_ID \
            --instance-type t3.micro \
            --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
            --security-group-ids $SG_ID \
            --query "Instances[0].InstanceId" \
            --output text)

            echo "Instance ID is : $INSTANCE_ID"

            # Conditon to get the Public or Private IP 
            if [ $instance == 'frontend' ]; then # Public IP
                    IP=$(aws ec2 describe-instances \
                    --instance-ids $INSTANCE_ID \
                    --query 'Reservations[].Instances[].PublicIpAddress' \
                    --output text)
                    RECORD_NAME=$DOMAIN_NAME # nagababu.online.com
                else
                    # Private IP 
                    IP=$(aws ec2 describe-instances \
                    --instance-ids $INSTANCE_ID \
                    --query 'Reservations[].Instances[].PrivateIpAddress' \
                    --output text) 
                    RECORD_NAME=$instance.$DOMAIN_NAME # mongodb.nagababu.online.com
            fi
    # Create the Hosted Zone Record and pass the Private IP
                echo "IP Address is : $IP"
                aws route53 change-resource-record-sets \
                --hosted-zone-id "$HOSTED_ZONE" \
                --change-batch '
                                    {
                    "Comment": "updating record",
                    "Changes": [
                        {
                        "Action": "UPSERT",
                        "ResourceRecordSet": {
                            "Name": "'$RECORD_NAME'",
                            "Type": "A",
                            "TTL": 1,
                            "ResourceRecords": [
                            {
                                "Value": "'$IP'"
                            }
                            ]
                        }
                        }
                    ]
                    }     
                    '       
        done