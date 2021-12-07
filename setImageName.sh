#!/bin/bash

TEMPLATE_DOCKER_ORG=dfdsdk
TEMPLATE_DOCKER_REPO=hello

echo "********************************************************************************"
echo
echo "A Docker image name has the format dockerOrganization/dockerRepository:version"
echo
echo "This script will let you set the dockerOrganization and dockerRepository names "
echo "that your CI/CD pipelines should use."
echo "The 'version' part will be supplied by the CI/CD pipeline."
echo
echo "Use CTRL+C to cancel"
echo
echo "********************************************************************************"
echo

read -p "Docker organization: [${TEMPLATE_DOCKER_ORG}] " DOCKER_ORG
read -p "Docker repository name: [${TEMPLATE_DOCKER_REPO}] " DOCKER_REPO

USE_DOCKER_ORG=${DOCKER_ORG:-$TEMPLATE_DOCKER_ORG}
USE_DOCKER_REPO=${DOCKER_REPO:-$TEMPLATE_DOCKER_REPO}

echo
echo "You selected ${USE_DOCKER_ORG} as Docker organization"
echo "You selected ${USE_DOCKER_REPO} as Docker repository"
echo
echo "The full image name is: ${USE_DOCKER_ORG}/${USE_DOCKER_REPO}"
echo
read -p "Would you like to save ${USE_DOCKER_ORG}/${USE_DOCKER_REPO} [N] ? " SAVE_FILE
echo

USE_SAVE_FILE=${SAVE_FILE:-'N'}

if [[ $USE_SAVE_FILE == 'Y' || $USE_SAVE_FILE == 'y' ]]; then
    echo "Updating IMAGE_NAME environment variable in GitHub Actions."
    sed -i "s/.*IMAGE_NAME:.*/  IMAGE_NAME: ${USE_DOCKER_ORG}\/${USE_DOCKER_REPO}/g" .github/workflows/docker.yaml
    echo
    echo "Updating imageName pipeline variable in Azure Devops."
    sed -i "s/.*imageName:.*/  imageName: \"${USE_DOCKER_ORG}\/${USE_DOCKER_REPO}\"/g" azure-pipelines.yml
else
    echo "You chose NOT to save ${USE_DOCKER_ORG}/${USE_DOCKER_REPO}. Update cancelled. "
fi
echo
echo "You should now add and commit the updated pipeline files to Git."
echo
echo "********************************************************************************"
