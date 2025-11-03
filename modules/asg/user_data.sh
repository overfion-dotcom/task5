#!/bin/bash
4.
set -e

# Fetch DB password from Secrets Manager
# $(aws secretsmanager get-secret-value --secret-id ${db_password_secret_arn} --region ${region} --query SecretString --output text)

# Login to ECR
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_repository_url}

# Pull and run container
docker pull ${ecr_repository_url}:${image_tag}

docker run -d \
    --name hotel \
    --restart unless-stopped \
    -p 80:80 \
    -e DB_HOST=${db_host} \
    -e DB_NAME=${db_name} \
    -e DB_USER=${db_user} \
    -e DB_PASSWORD= $(aws secretsmanager get-secret-value --secret-id ${db_password_secret_arn} --region ${region} --query SecretString --output text | jq -r ."password") \
    ${ecr_repository_url}:${image_tag}
