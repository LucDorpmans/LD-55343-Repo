Set-NetIsatapConfiguration -Router 172.16.0.1 
Get-NetIPAddress | Format-Table InterfaceAlias, InterfaceIndex, IPv6Address 
Get-NetIPAddress | Format-Table InterfaceAlias, InterfaceIndex, IPv6Address | Out-File c:\ISATAP.txt 

Get-NetIPInterface -InterfaceIndex 15 -PolicyStore ActiveStore | Format-List
Set-NetIPInterface -InterfaceIndex 15 -Advertising Enabled


New-NetRoute -InterfaceIndex 15 -DestinationPrefix fd00::/64 -Publish Yes 

# Do the rest of the Lab on the other VMs



# Remove config before Ex. 4
Set-NetIPInterface -InterfaceIndex 15 -Advertising Disable 
Remove-netroute -InterfaceIndex 15 -Publish Yes 
Restart-Service iphlpsvc 
