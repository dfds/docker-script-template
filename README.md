# docker-script-template

- [docker-script-template](#docker-script-template)
  - [Choose a CI/CD pipeline engine](#choose-a-cicd-pipeline-engine)
  - [Choose a Docker Hub repository name](#choose-a-docker-hub-repository-name)
    - [Update pipelines](#update-pipelines)
  - [Consider updating .gitignore](#consider-updating-gitignore)

A template for creating Docker image as wrapper around scrips.

After creating a new GitHib repository based on this template, you need to:

1. Choose a CI/CD pipeline engine.
2. Choose a Docker Hub repository name.
3. Consider updating .gitignore

## Choose a CI/CD pipeline engine

Choose only one CI/CD engine. You can use either one of these:

- Azure DevOps Pipelines (recommended). More info [here](docs/AZURE_DEVOPS.md).
- GitHub Actions workflow (recommended). More info [here](docs/GITHUB_ACTIONS.md).
- Docker Hub builds  (not recommended). More info [here](docs/DOCKER_HUB.md).

## Choose a Docker Hub repository name

The Docker Hub repostory name is used to push and pull images. The name must be unique.

Example:

```text
dfdsdk/hello
```

There is a script in this template project that can be used to set your Docker Hub repostory name
in the pipelines, so it knows where to push the built images. Run *setImageName.sh* and follow the on-screen instructions.

### Update pipelines

```bash
./setImageName.sh
```

It will look something like this:

```bash
./setImageName.sh

********************************************************************************

A Docker image name has the format dockerOrganization/dockerRepository:version

This script will let you set the dockerOrganization and dockerRepository names
that your CI/CD pipelines should use.
The 'version' part will be supplied by the CI/CD pipeline.

Use CTRL+C to cancel

********************************************************************************

Docker organization: [dfdsdk]
Docker repository name: [hello] myscript

You selected dfdsdk as Docker organization
You selected myscript as Docker repository

The full image name is: dfdsdk/myscript

Would you like to save dfdsdk/myscript [N] ? y

Updating IMAGE_NAME environment variable in GitHub Actions.

Updating imageName pipeline variable in Azure Devops.

You should now add and commit the updated pipeline files to Git.

********************************************************************************
```

## Consider updating .gitignore

Since Python is the preferred language for our SRE scripts, the .gitignore file supplied
by the template project is written for Python. If your project is written for other languages,
you ought to replace the supplied .gitignore file with your own.
