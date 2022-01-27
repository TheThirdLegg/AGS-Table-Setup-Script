# Input asking for the table number. Hyphen seperation is reqired, assigns input to variable "$TableName"
$TableName = Read-Host -Prompt 'Enter Table Name with hyphen (ie. BJ-411)'

# Renames Windows host name/Computer Name to the Table Name ($TableName)
# Rename-Computer -NewName "$TableName"

# Splits the variable "$TableName" at the hyphen. Assigining it to an array "TableNameArray". First half is assigned to variable "$GameType", Second half is assigned to a variable "$TableNumber"
$TableNameArray = $TableName.Split("{-}")
$GameType = $TableNameArray[0]
$TableNumber = $TableNameArray[1]

if ($TableName) {
    Write-Host "Table Name is [$TableName]"
    Write-Host "Game Type Abreviation is [$GameType]"
    Write-Host "Table Number is [$TableNumber]"
} else {
    Write-Warning -Message "No server name input. Please restart script."
}

$ServerIP = Read-Host -Prompt 'Enter The Server IP'

$EndpointAddressTemp = $ServerIP + ':8088/Stax/DealerService'

Write-Host 'If ' $EndpointAddressTemp ' if the correct Endpoint, type Y, if not Type N'

$confirmation = Read-Host '(Y)es or (N)o'
if ($confirmation -eq 'y') {
    $EndpointAddress = $EndpointAddressTemp
} elseif ($confirmation -eq 'n') {
    $EndpointAddress = Read-Host -Prompt 'Enter Custom Endpoint Adress (ie. 172.16.0.8:8088/Stax/DealerService)'
}

Write-Host '"' $EndpointAddress '" is your endpoint.'

$ServerOctet  = $ServerIP.Split("{.}")
$ServerOctet


$EndpointFile = 'C:\ags\ags.stax\Ags.Tables.Stax.DealerTerminal.exe.config'
$regex = '<endpoint address=".*'
(Get-Content $EndpointFile) -replace $regex, $EndpointAddressText | Set-Content $EndpointFile




Read-Host -Prompt "Press Enter to exit"
