# Remove config of Ex. 3 before Ex. 4:
Set-NetIPInterface -InterfaceIndex 15 -Advertising Disable 
Remove-netroute -InterfaceIndex 15 -Publish Yes 
Restart-Service iphlpsvc 

#18. 
Set-NetIPInterface –AddressFamily ipv6 –InterfaceAlias “London_Network” –Advertising Enabled –AdvertiseDefaultRoute Enabled 

#19. 
Set-NetIPInterface –AddressFamily ipv6 –InterfaceAlias “NA_WAN” –Advertising Enabled –AdvertiseDefaultRoute Enabled 

#20. 
New-NetRoute -InterfaceAlias “London_Network” -DestinationPrefix fd00::/64 -Publish Yes

#21. 
New-NetRoute -InterfaceAlias “NA_WAN” -DestinationPrefix fd00::/64 -Publish Yes

#22. 
Get-NetIPAddress | Format-Table IPAddress,InterfaceAlias 

#23. Document the link-local IPv6 address of London_Network adapter. 
#    This IPv6 address will be used in the next step.

#24. Replace link-local address of EU-RTR “London_Network” interface with the IPv6 address you documented in the previous step. When typing the IPv6 address, 
#    do not type the percent sign (%) sign and do not type the numbers after the %.

#25. 
New-NetRoute -InterfaceAlias "London_Network" –DestinationPrefix ::/0 -NextHop fe80::7d07:98e7:d812:7c2d  –Publish yes 
# Note: As you may recall from the lesson, the prefix for link-local addresses is always FE80::/64.
# Get-NetRoute -InterfaceAlias “London_Network” -DestinationPrefix ::/0 | Remove-NetRoute


# Task 2: Verify the native IPv6 configuration
# 1. Switch to EU-RTR! 
Get-NetIPAddress | Format-Table IPAddress,InterfaceAlias 
