Add-DnsServerClientSubnet -Name "UKSubnet" -IPv4Subnet "172.16.0.0/24" 
Add-DnsServerClientSubnet -Name "CanadaSubnet" -IPv4Subnet "172.16.18.0/24" 
Add-DnsServerZoneScope -ZoneName "Adatum.com" -Name "UKZoneScope" 
Add-DnsServerZoneScope -ZoneName "Adatum.com" -Name "CanadaZoneScope" 
Add-DnsServerResourceRecord -ZoneName "Adatum.com" -A -Name "www" -IPv4Address "172.16.0.41" -ZoneScope "UKZoneScope" 
Add-DnsServerResourceRecord -ZoneName "Adatum.com" -A -Name "www" -IPv4Address "172.16.18.17" -ZoneScope "CanadaZoneScope" 
Add-DnsServerQueryResolutionPolicy -Name "UKPolicy" -Action ALLOW -ClientSubnet "eq,UKSubnet" -ZoneScope "UKZoneScope,1" -ZoneName "Adatum.com" 
Add-DnsServerQueryResolutionPolicy -Name "CanadaPolicy" -Action ALLOW -ClientSubnet "eq,CanadaSubnet" -ZoneScope "CanadaZoneScope,1" -ZoneName Adatum.com 