#Begin script
Write-Output "Starting Script"
#Install and configure DHCP as in Mod 1
Add-WindowsFeature DHCP
Add-WindowsFeature RSAT-DHCP
Add-DhcpServerInDC
Add-DhcpServerv4Scope -Name "Houston Wired" -StartRange 172.16.20.2 -EndRange 172.16.21.254 -SubnetMask 255.255.254.0 -Description "Houston Wired"
netsh dhcp server scope 172.16.20.0 set optionvalue 003 ipaddress 172.16.20.1
netsh dhcp server scope 172.16.20.0 set optionvalue 006 ipaddress 172.16.0.10
Add-DhcpServerv4Scope -Name "Mexico City Wired" -StartRange 172.16.22.2 -EndRange 172.16.22.254 -SubnetMask 255.255.255.0 -Description "Mexico City Wired"
netsh dhcp server scope 172.16.22.0 set optionvalue 003 ipaddress 172.16.22.1
netsh dhcp server scope 172.16.22.0 set optionvalue 006 ipaddress 172.16.0.10
Add-DhcpServerv4Scope -Name "Portland Wired" -StartRange 172.16.23.2 -EndRange 172.16.23.254 -SubnetMask 255.255.255.0 -Description "Portland Wired"
netsh dhcp server scope 172.16.23.0 set optionvalue 003 ipaddress 172.16.23.1
netsh dhcp server scope 172.16.23.0 set optionvalue 006 ipaddress 172.16.0.10
Add-DhcpServerv4Failover -Name TOR-LON-Failover -PartnerServer Lon-SVR1.Adatum.com -ScopeID 172.16.20.0,172.16.22.0,172.16.23.0 -MaxClientLeadTime 0:15:00 -ServerRole Standby
Write-Output "Script Complete"
