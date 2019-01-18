# Sign in to your Azure account
Login-AzureRmAccount

# Initialize variables
$subscriptionName = "[subscription name]"
$location = "centralus"
$path = "[path to folder]"

# Set the current subscription
Select-AzureRmSubscription -SubscriptionName $subscriptionName

# Create the resource group for Dev resources
$rgName = "winvmtest"
$rg = Get-AzureRmResourceGroup -Name $rgName -Location $location -ErrorAction Ignore
if ($rg -eq $null)
{
    Write-Output "Creating $rgName in $location"
    New-AzureRMResourceGroup -Name $rgName -Location $location
}

# Create the Dev resources
$deployName = ("Deployment-{0}-{1}" -f $rgName, $(Get-Date).ToString("yyyyMMddhhmmss"))
$templateFile = "$path\simplevmdeploy.json"
$templateParamFile = "$path\simplevmparams.json"
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile $templateFile  -TemplateParameterFile $templateParamFile -Mode Incremental
New-AzureRMResourceGroupDeployment -Name $deployName -ResourceGroupName $rgName -TemplateFile $templateFile -TemplateParameterFile $templateParamFile -Mode Incremental
Get-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -Name $deployName

<#
Remove-AzureRmResourceGroup -Name $rgName
#>