# Azure ARM template for Windows Server with Custom Script Extension

The ARM template contained in this repo allows you to create 1-to-many Windows Servers as well as installs Chocolatey, VS Code, and Git. You're welcome to substitiute your own Custom Script Extension. 

Below are instructions on how to use both the deployment (simplevmdeploy.json) and parameters file (simplevmparams.json). Additionally, I've included in this repo are two deployment options: Azure CLI or Azure PowerShell. 

## Notes about the Deployment and Parameters file

Please refer to [Understand the structure and syntax of Azure Resource Manager Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates) for basic understanding of how Azure ARM templates are built and used. 

The PowerShell script for the Custom Script Extension is on line 202 of the deployment file. The Script installs Chocolatey, VS Code, and Git. Feel free to update for your own needs. 

You can create 1-to-many Windows Servers in Azure by incrementing the copyNum parameter on line 6 of the parameter file.

## Update CLI file

Update both the name of the Resource Group and Location.

## Update PowerShell file

Update variables on lines 5, 6, and 7. Optionally, update the resource group name on line 13.