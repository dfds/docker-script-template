# Pipeline on Azure DevOps

Setting up the pipeline on Azure DevOps is pretty straightforward, but it also involves a few manual steps.

These steps include:

- Creating a pipeline in Azure DevOps based on your YAML pipeline file.
- Permit the pipeline to use the Service Connection to Docker Hub.

## Step by step guide

1. Login to Azure DevOps and navigate to *Pipelines* under your project.
2. Click on *New pipeline* button.
3. Select *GitHub* YAML.
4. In the *Filter by keyboard* text item, search for your newly created GitHub repository.
5. You probably need to choose *All repositories* in the dropdown box.
6. Select your GitHub repository, and Azure DevOps will load the repository's YAML file.
7. Next to the *Run* button, click on the dropdown and choose *Save*.
8. Click on the *Run pipeline* button.
9. When the *Run pipeline* wizard opens, click on the *Run* button.
10. You will now see a warning that says *"This pipeline needs permission to access a resource before this run can continue to Build image"*
11. Click on the *View* button next to the warning.
12. Click on the *Permit* button.
13. You will be asked to confirm. Click on the second *Permit* button.
