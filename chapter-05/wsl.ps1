[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $Name
)

Write-Host "Hello from WSL: $Name"
Write-Host "Current directory: $PWD"
Get-EventLog -Log Application | Select-Object -First 10 | Format-Table Index,Source, Message
