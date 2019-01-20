################################################
#                                              #
# Export Microsoft DNS script. Coded by Czompi #
#                                              #
################################################
#
# This script officially available through the following GitHub Repo
# https://github.com/Czompi/PowerShell
#
# This project is protected by GNU v3 LICENSE.
# 
# 
$scriptname = "ExportDNS"
$path = Read-Host -Prompt "[$scriptname]<[IN] Location (relative, default is 'DNS')"; if($path.Length -eq 0) {$path = "DNS"} $path = "C:\" + $path
if(!(Test-Path $path)) {$newdir = New-Item -ItemType Directory -Force -Path "C:\"+$path | Out-Null; Write-Host "[$scriptname]>[DIR] 'C:\DNS' directory is created successfully."}
$dnsserver = Read-Host -Prompt "[$scriptname]<[IN] Source DNS server (default is 'DC')"; if($dnsserver.Length -eq 0) {$dnsserver = "DC"}
$zones = Get-DnsServerZone -ComputerName $dnsserver
for ($i = 0; $i -lt $zones.length; $i++) {
    $zonename = $zones[$i].ZoneName
    $file = "../../../../DNS/" + $zonename + ".txt"
    if(Test-Path $file -PathType Leaf) { Write-Host "[$scriptname]>[$dnsserver] The 'C:\DNS\$zonename.txt' file already exists.";continue; }
    try {
        Export-DnsServerZone -Name $zonename -FileName $file
        Write-Host "[$scriptname]>[$dnsserver] Successfully exported '$zonename' zone to 'C:\DNS\$zonename.txt'"
    } catch {
        Write-Host "[$scriptname]>[$dnsserver] Error occurred when trying to export '$zonename' zone.";
    }
}

Write-Host "[$scriptname]>[BYE]"
Write-Host "[$scriptname]>[BYE] Script finished its work. Thank you for choosing this product."
Write-Host "[$scriptname]>[BYE] This script is coded by Czompi <https://czompi.hu>"