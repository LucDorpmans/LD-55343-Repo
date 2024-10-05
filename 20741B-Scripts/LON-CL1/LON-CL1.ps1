Remove-NetIPAddress -InterfaceAlias "London_Network" # -Confirm:$false

Get-NetIPConfiguration

Get-NetIPAddress -AddressFamily IPv6 | Select-Object InterfaceIndex, IPAddress | Ft