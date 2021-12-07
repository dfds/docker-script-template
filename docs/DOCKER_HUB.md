# Pipeline on Docker Hub

It is possible to use Docker Hub as CI/CD engine for building and publishing Docker images
from source code stored on GitHub. It requires several manual steps and is thus normally not recommended.

These steps include:

- Create repository on Docker Hub.
- Choose visibility for the repository.
- Configure Build Settings.

## Step by step guide

1. Login to Docker Hub.
2. Click on the *Create Repository* button.
3. In the dropdown box, select *dfdsdk* under *Organizations*.
4. Give your repository a **Name**. This name must be unique in the dfdsdk organization.
5. Preferably also give the repository a **Description**.
6. Select *Visibility*. Either *Public* or *Private*.
7. Under *Build Settings*, click on the *Connected* logo for GitHub's octocat.
8. Select GitHub *organzation* and GitHub *repository* to find the location of your source code.
9. Choose the *Branch* from which you want to trigger builds. Usually *main* or *master*.
10. Click on the *Create* button.
11. Now go into the *Build* tab, and click on the *Configure Automated Builds* button.
12. Scroll down to the *Build Rules*.
13. Click on the *plus sign* to the right of the *Build Rules*.
14. In the new dropdown box for *Source Type*, choose *Tag*.
15. In the new *Source*, write: /^[0-9.]+$/
16. In the new *Docker Tag*, write: {sourceref}
17. Ensure that *Autobuild* and *Build Caching* are enabled.
18. Click on *Save*.
