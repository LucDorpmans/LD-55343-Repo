#Begin script
Write-Output "Starting Script"
#Install and configure DHCP as in Mod 1
Add-WindowsFeature DHCP
Add-WindowsFeature RSAT-DHCP
Add-DhcpServerInDC
Add-DhcpServerv4Scope -Name "Houston-Wired1" -StartRange 172.16.30.2 -EndRange 172.16.30.254 -SubnetMask 255.255.255.0 -Description "Houston-Wired1"
# netsh dhcp server scope 172.16.30.0 set optionvalue 003 ipaddress 172.16.30.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.30.0 -Router 172.16.30.1 
# netsh dhcp server scope 172.16.30.0 set optionvalue 006 ipaddress 172.16.0.10
Set-DhcpServerv4OptionValue  -ScopeID 172.16.30.0 -OptionId 006 -Value 172.16.0.10

Add-DhcpServerv4Scope -Name "Houston-Wired2" -StartRange 172.16.31.1 -EndRange 172.16.31.254 -SubnetMask 255.255.255.0 -Description "Houston-Wired2"
# netsh dhcp server scope 172.16.31.0 set optionvalue 003 ipaddress 172.16.31.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.31.0 -Router 172.16.31.1 
# netsh dhcp server scope 172.16.31.0 set optionvalue 006 ipaddress 172.16.0.10
Set-DhcpServerv4OptionValue  -ScopeID 172.16.31.0 -OptionId 006 -Value 172.16.0.10

Add-DhcpServerv4Scope -Name "Houston-Wireless" -StartRange 172.16.55.1 -EndRange 172.16.55.254 -SubnetMask 255.255.255.0 -Description "Houston-Wireless"
# netsh dhcp server scope 172.16.55.0 set optionvalue 003 ipaddress 172.16.55.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.55.0 -Router 172.16.55.1 
# netsh dhcp server scope 172.16.55.0 set optionvalue 006 ipaddress 172.16.0.10
Set-DhcpServerv4OptionValue  -ScopeID 172.16.55.0 -OptionId 006 -Value 172.16.0.10

Add-DhcpServerv4Scope -Name "MexicoCity-Wired" -StartRange 172.16.35.2 -EndRange 172.16.35.254 -SubnetMask 255.255.255.0 -Description "MexicoCity-Wired"
# netsh dhcp server scope 172.16.35.0 set optionvalue 003 ipaddress 172.16.35.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.35.0 -Router 172.16.35.1 
# netsh dhcp server scope 172.16.35.0 set optionvalue 006 ipaddress 172.16.0.10
Set-DhcpServerv4OptionValue  -ScopeID 172.16.35.0 -OptionId 006 -Value 172.16.0.10

Add-DhcpServerv4Scope -Name "MexicoCity-Wireless" -StartRange 172.16.56.2 -EndRange 172.16.56.254 -SubnetMask 255.255.255.0 -Description "MexicoCity-Wireless" 
# netsh dhcp server scope 172.16.56.0 set optionvalue 003 ipaddress 172.16.56.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.56.0 -Router 172.16.56.1 
# netsh dhcp server scope 172.16.56.0 set optionvalue 006 ipaddress 172.16.0.10
Set-DhcpServerv4OptionValue  -ScopeID 172.16.56.0 -OptionId 006 -Value 172.16.0.10

Add-DhcpServerv4Scope -Name "Portland-Wired" -StartRange 172.16.40.2 -EndRange 172.16.40.254 -SubnetMask 255.255.255.0 -Description "Portland-Wired"
# netsh dhcp server scope 172.16.40.0 set optionvalue 003 ipaddress 172.16.40.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.40.0 -Router 172.16.40.1 
# netsh dhcp server scope 172.16.40.0 set optionvalue 006 ipaddress 172.16.0.10

Add-DhcpServerv4Scope -Name "Portland-Wireless" -StartRange 172.16.57.2 -EndRange 172.16.57.254 -SubnetMask 255.255.255.0 -Description "Portland-Wireless" 
# netsh dhcp server scope 172.16.57.0 set optionvalue 003 ipaddress 172.16.57.1
Set-DhcpServerv4OptionValue -ScopeID 172.16.57.0 -Router 172.16.57.1 
# netsh dhcp server scope 172.16.57.0 set optionvalue 006 ipaddress 172.16.0.10
Set-DhcpServerv4OptionValue  -ScopeID 172.16.57.0 -OptionId 006 -Value 172.16.0.10

# Remove-DhcpServerv4FailoverScope
Add-DhcpServerv4Failover -Name TOR-LON-Failover -PartnerServer Lon-SVR1.Adatum.com -ScopeID 172.16.30.0,172.16.31.0,172.16.35.0 -MaxClientLeadTime 0:15:00 -ServerRole Standby


Write-Output "Script Complete"
