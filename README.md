# docker-script-template

- [docker-script-template](#docker-script-template)
  - [Choose a Docker Hub repository name](#choose-a-docker-hub-repository-name)
    - [Update pipelines](#update-pipelines)
  - [Start hacking](#start-hacking)

A template for creating Docker image as wrapper around scrips.

After creating a new GitHib repository based on this template, you need to:

1. Choose a Docker Hub repository name.
2. Consider updating .gitignore
3. Start hacking

## Choose a Docker Hub repository name

The Docker Hub repository name is used to push and pull images. The name must be unique.

Example:

```text
dfdsdk/hello
```

There is a script in this template project that can be used to set your Docker Hub repository name
in the pipelines, so it knows where to push the built images. Run *setImageName.sh* and follow the on-screen instructions.

### Update pipelines

```bash
./setImageName.sh
```

## Start hacking

- Put your script source files inside the src directory.
- Update the Dockerfile to fit your needs, for example using another base image.
- Update the src/entrypoint.sh script to call your script.
- Optionally add a CMD instruction with opinionated arguments to your script.
- Replace the contents of this README.md file with instructions for how to run your Docker image.
