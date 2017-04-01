# Starter Site for Flask On Azure Web Apps

---

<a name="overview"></a>

## Overview

This repo has the miminum code required for an Azure Flask project deployment and documents the minimal steps required to get it running from your machine.

This originaly started with a blog post by Tim Reilly.  You can check out Tim's orignal, [here](http://timmyreilly.azurewebsites.net/starter-site-for-flask-on-azure-web-apps/) if you want, but things have changed somewhat since then.  Better to just follow the steps below.

---

<a name="prerequisites"></a>

## Prerequisites

To complete this walkthrough you will need:

- A computer running Windows 10, Mac OSx or Linux.
- Python 2.7.x or later (3.x is fine).  Get it from <a target="_blank" href="https://www.python.org/downloads/">Python Downloads</a> if you need it.
- Visual Studio Code.  Install it from <a target="_blank" href="http://code.visualstudio.com">code.visualstudio.com</a> for your platform
- The Azure CLI 2.0.  Read how to <a target="_blank" href="https://docs.microsoft.com/en-us/cli/azure/install-azure-cli">Install the Azure CLI 2.0</a>
- An active Azure subscription.  You can sign up for an <a target="_blank" href="http://azure.com/free">Azure Free Trial</a> if needed.


---

<a name="Steps"></a>

## Steps

1. Log in to your Azure subscription via the Azure CLI 2.0. Learn how by reading how to <a target="_blank" href="https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli#log-in-to-azure">Login to Azure</a>


1. Create the resource group in the portal, or in the Azure CLI 2.0:

    ```bash
    az group create --name <yourgroup> -l <yourlocation>
    ```

    Example:

    ```bash
    az group create --name bspygroup -l westus
    ```

1. Create the app service plan and web app in the portal or in the Azure CLI 2.0

    ```bash
    az appservice plan create -n <yourplan> -g <yourgroup> -l <yourlocation>
    az appservice web create -n  <yourweb> -p <yourplan> -g <yourgroup>
    ```

    Example:

    ```bash
    az appservice plan create -n bspyplan -g bspygroup -l westus
    az appservice web create -n bspyweb -p bspyplan -g bspygroup
    ```

1. Configure the local git repo on the web site

    ```bash
    az appservice web source-control config-local-git -n <yourweb> -g <yourgroup>
    ```

    Example:

    ```bash
    az appservice web source-control config-local-git -n bspyweb -g bspygroup
    ```

    Example output:

    ```bash
    az appservice web source-control config-local-git -n bspyweb -g bspygroup
    {
    "url": https://bss17user@bspyweb.scm.azurewebsites.net/bspyweb.git
    }
    ```

    **COPY THE URL TO YOUR WEB SITES GIT REPO FOR LATER USE**

1. Create a directory on your system and clone a lightweight flask repo into it:

    ```bash
    mkdir <yourweb>
    cd <yourweb>
    git clone https://github.com/timmyreilly/babypython-azure.git 
    ```

    Example:

    ```bash
    mkdir /bspyweb
    cd /bspyweb
    git clone https://github.com/timmyreilly/babypython-azure.git .
    ```


1. Remove the origin remote

    ```bash
    git remote remove origin
    ```

1. Add the web site repo as a remote:

    ```bash
    git remote add origin <YOUR_WEBSITES_GIT_REPO_URL_COPIED_ABOVE>
    ```

    Example:

    ```bash
    git remote add origin https://bspyweb.scm.azurewebsites.net/bspyweb.git
    ```

1. Git push origin master to push your flask site up to your Azure Web App

    ```bash
    git push origin master
    ```

1. Verify site in azure by opening it in your browser:

    ```bash
    http://<yourweb>.azurewebsites.net
    ```

    Example:

    ```bash
    http://bspyweb.azurewebsites.net
    ```

1. Open site in VS Code.  (install code from <a target="_blank" href="http://code.visualstudio.com">http://code.visualstudio.com</a> if needed). From the terminal, change into the folder where the site is:

    ```bash
    cd <yourweb>
    ```

    run “code .”:

    ```bash
    code .
    ```

1. Modify code in `FlaskWebProject/views.py` or `FlaskWebProject/templates/index.html`

1. From the terminal in the folder where the repo is, Git commit

    ```bash
    git add .
    git commit -m “made some changes”
    ```

1. Push your changes up to the new "origin" repo in Azure...

    ```bash
    git push origin master
    ``` 

1. Refresh the site again in the browser (may take a minute or two for the push to complete)


 
