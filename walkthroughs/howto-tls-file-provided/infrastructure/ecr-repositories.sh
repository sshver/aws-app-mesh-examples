#!/bin/bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

aws --profile "${AWS_PROFILE}" --region "${AWS_DEFAULT_REGION}" \
    cloudformation deploy \
    --stack-name "${ENVIRONMENT_NAME}-ecr-repositories" \
    --capabilities CAPABILITY_IAM \
    --template-file "${DIR}/ecr-repositories.yaml" \
    --parameter-overrides \
    FrontendImageName="${FRONTEND_IMAGE_NAME}" \
    ColorTellerImageName="${BACKEND_IMAGE_NAME}" \
    ColorAppEnvoyImageName="${COLOR_APP_ENVOY_IMAGE_NAME}"
