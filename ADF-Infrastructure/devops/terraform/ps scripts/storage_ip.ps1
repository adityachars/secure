param (
    [parameter(Mandatory = $true)] [String] $resourceGroup,
    [parameter(Mandatory = $true)] [String] $adfStorageAccount
)

$IP_ADD = Invoke-RestMethod http://ipinfo.io/json | Select-Object -exp ip
Write-Output "Opening firewall: $IP_ADD"

Add-AzStorageAccountNetworkRule -ResourceGroupName $resourceGroup -Name $adfStorageAccount -IPAddressOrRange $IP_ADD
