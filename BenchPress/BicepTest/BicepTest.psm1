Write-Host "Bicep Test Framework installed"

<#
.Synopsis
Bicep test Module

.DESCRIPTION
Test Framework for Bicep


.Example
Get-ResourceGroupExists("YourResourceGroupName")

#>

function Get-ResourceGroupExists([string]$resourceGroupName) {
    $rg = Get-AzResourceGroup $resourceGroupName
    if ($null -eq $rg) {
        throw "Resource group $resourceGroupName was not found!"
    }
    else{
        return $true
    }
}

function Deploy-BicepFeature([string]$path, $params){
    bicep build $path
    $code = $?
    if ($code -eq "True"){ # arm deployment was successful
        New-AzSubscriptionDeployment -Location $params.location -TemplateFile examples/main.json -TemplateParameterObject $params
    }
}

function Remove-BicepFeature($params){
    Get-AzResourceGroup -Name $params.name | Remove-AzResourceGroup -Force
}

Export-ModuleMember -Function * -Cmdlet *