# Pipeline on GitHub Actions

- [Pipeline on GitHub Actions](#pipeline-on-github-actions)
  - [Grant access to Action secrets needed by the pipeline](#grant-access-to-action-secrets-needed-by-the-pipeline)
  - [Create Action secrets needed by the pipeline](#create-action-secrets-needed-by-the-pipeline)
  - [Known issues](#known-issues)

Setting up the pipeline on GitHub Actions is very straightforward, but it also involves a few manual steps.

These steps include:

- Either: Grant access to Action secrets needed by the pipeline.
- Or: Create Action secrets needed by the pipeline.

## Grant access to Action secrets needed by the pipeline

If you are a GitHub organization administrator, you can grant access to Action secrets defined at organization level.

1. Navigate to <https://github.com/organizations/dfds/settings/secrets/actions>
2. Next to the *DOCKERHUB_TOKEN* Action secret, click on the *Update* button.
3. Click on the *cog wheel* icon, and add your repository to the *filtered repositories*.
4. Click on the **Update selection** button.
5. Click on the *Save changes* button.
6. Repeat steps 2-5 for the *DOCKERHUB_USERNAME* Action secret.

## Create Action secrets needed by the pipeline

If you are not a GitHub organization administrator, you can create your own Action secrets at repository level.

1. In your GitHub repository, click on *Settings*.
2. Under *Settings*, click on *Secrets*.
3. Click on *New repository secret*.
4. Fill in *Name*: DOCKERHUB_TOKEN
5. Fill in *Value*: [^1]
6. Click on the *Add secret* button.
7. Click on *New repository secret*.
8. Fill in *Name*: DOCKERHUB_USERNAME
9. Fill in *Value*: [^2]
10. Click on the *Add secret* button.

[^1]: A Docker Hub Access Token can be created under <https://hub.docker.com/settings/security>
[^2]: The username that own the Docker Hub Access Token.

## Known issues

The GitHub Actions workflow defined in .github/workflows/docker.yaml bas prepared with a step to
publish this repository's README.md to the Docker Hub repository to serve as a readme there too.
Currently this do not work when using Docker Hub access tokens with a Personal or team account.
It will only work with a Pro or Enterprise account.

Hence updating the readme on the Docker Hub repository is a manual activity.
