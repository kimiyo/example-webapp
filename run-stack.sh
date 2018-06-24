#!/bin/bash

aws cloudformation $ACTION \
    --region ap-northeast-2 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=140267441671.dkr.ecr.ap-northeast-2.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-c92271a1 \
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:ap-northeast-2:140267441671:listener/app/production-website/60cbfdb1a32559f2/e1df31cd6c9ab311