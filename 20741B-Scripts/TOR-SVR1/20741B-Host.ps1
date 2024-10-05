# 20741B-Host 

Get-VM | Set-VMMemory -DynamicMemoryEnabled $True 
Get-VM | Get-VMProcessor | Set-VMProcessor -Count 2 
Get-VM | Select Name, DynamicMemoryEnabled, ProcessorCount 


Get-VM | Checkpoint-VM -SnapshotName "AfterUpdateProcessing" 

Get-VM | Restore-VMSnapshot -Name "AfterUpdateProcessing" -Confirm

Start-VM -Name 20741B-LON-DC1
Start-VM -Name 20741B-EU-RTR
Start-VM -Name 20741B-LON-SVR1
Start-VM -Name 20741B-LON-SVR1
Start-VM -Name 20741B-LON-CL1
Start-VM -Name 20741B-LON-CL2
Start-VM -Name 20741B-LON-TOR1
Start-VM -Name 20741B-LON-SYD1

Start-VM -Name 20741B-INET1

# Mod x Lab A
Get-VM 20741B-LON-CL1 | Get-VMNetworkAdapter | Where SwitchName -eq "London_Network" | Connect-VMNetworkAdapter -SwitchName "HOU_WAN"

Get-VM 20741B-LON-CL2 | Get-VMNetworkAdapter | Where SwitchName -eq "London_Network" | Connect-VMNetworkAdapter -SwitchName "NA_WAN"

Get-VMSwitch
