Set-Net6to4Configuration -State Enabled

Set-NetIPInterface -InterfaceAlias "6to4_Adapter" -Forwarding Enabled

Set-NetIPInterface -InterfaceAlias "London_Network" -Forwarding Enabled

Get-NetIPAddress | ft IPAddress, InterfaceAlias