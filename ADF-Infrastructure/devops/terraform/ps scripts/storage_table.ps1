param (
    [parameter(Mandatory = $true)] [String] $resourceGroup,
    [parameter(Mandatory = $true)] [String] $adfStorageAccount
)

Install-Module -Name AzTable -Force
Import-Module AzTable  

$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroup -Name $adfStorageAccount
$ctx = $storageAccount.Context

$variable = Get-Content ".\variables.txt" | Out-String | ConvertFrom-StringData
$tableName = "$($variable.table)"

#Retrieve the table if it already exists.
$table = Get-AzStorageTable –Name $tableName -Context $ctx -ErrorAction Ignore

#Create a new table if it does not exist.
if ($table -eq $null)
{
   $table = New-AzStorageTable –Name $tableName -Context $ctx

  $table = Get-AzStorageTable –Name $tableName -Context $ctx
  $cloudTable = $table.CloudTable

 Add-AzTableRow `
    -table $cloudTable `
    -partitionKey "$($variable.partionkey1)" `
    -rowKey ("$($variable.rowkey1)") -property @{"username"="$($variable.username1)";"userid"="$($variable.userid1)"}

 Add-AzTableRow `
    -table $cloudTable `
    -partitionKey "$($variable.partionkey2)" `
    -rowKey ("$($variable.rowkey2)") -property @{"username"="$($variable.username2)";"userid"="$($variable.userid2)"}

 Add-AzTableRow `
    -table $cloudTable `
    -partitionKey "$($variable.partionkey3)" `
    -rowKey ("$($variable.rowkey3)") -property @{"username"="$($variable.username3)";"userid"="$($variable.userid3)"}
}
