Write-Host -ForegroundColor Yellow "Gaining Admin Rights"

start-process powershell –verb runAs

Write-Host -ForegroundColor Yellow "Removing Gaming Services Completely"

Get-AppxPackage *gamingservices* -allusers | remove-appxpackage -allusers

Remove-Item -Path "HKLM:\System\CurrentControlSet\Services\GamingServices" -recurse

Remove-Item -Path "HKLM:\System\CurrentControlSet\Services\GamingServicesNet" -recurse

Write-Host -ForegroundColor Yellow "Repairing missing System Files"

sfc /scannow

code C:\Windows\Logs\CBS\CBS.log

Write-Host -ForegroundColor Yellow "Reinstalling pormpt to install MS Gaming services from MS Store"

start ms-windows-store://pdp/?productid=9MWPM2CQNLHN