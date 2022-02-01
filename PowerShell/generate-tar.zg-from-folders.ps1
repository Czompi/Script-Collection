$7z_loc = "C:\Program files\7-Zip\7z";
$versions = (Get-ChildItem -Attributes Directory -Name)
Write-Output "Following versions are detected:"
foreach ($ver in $versions) {
    Write-Output $ver
}
# Write-Output "Do you want to continue? (Y/n)"

# if((Read-Host) -ne "y" && (Read-Host) -ne "") {
#     # Exit
# }

foreach ($ver in $versions) {
    Write-Output "Generating ""$ver.tar"" from ""$ver"" folder..."
    Set-Location "$ver";
    & $7z_loc a -ttar "..\$ver.tar" -aoa;
    Set-Location "..\";

    Write-Output "Generating ""$ver.tar.gz"" from ""$ver.tar""..."
    & $7z_loc a -tgzip "$ver.tar.gz" "$ver.tar" -aoa;


    Remove-Item -Path "$ver.tar"
}

# Exit