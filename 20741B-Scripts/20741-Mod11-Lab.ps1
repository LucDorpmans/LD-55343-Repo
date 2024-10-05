
#1. On LON-SVR2, right-click Start, and then click Windows PowerShell (Admin).
#2. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
$node=New-NetworkControllerNodeObject -Name "Node1" -Server "LON-SVR2.Adatum.com" -FaultDomain "fd:/rack1/host1" -RestInterface “London_Network” 

#3. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
$Certificate = Get-Item Cert:\LocalMachine\My | Get-ChildItem | where {$_.Subject -imatch "LON-SVR2" } 

#4. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
Install-NetworkControllerCluster -Node $node -ClusterAuthentication Kerberos -ManagementSecurityGroup "Adatum\Network Controller Admins" -CredentialEncryptionCertificate $Certificate 

#Task 3: Configure the Network Controller application
# Note: This step is duplicated in the detailed steps for this lab because of the complexity of the Windows PowerShell cmdlets.
At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
Install-NetworkController -Node $node -ClientAuthentication Kerberos -ClientSecurityGroup "Adatum\Network Controller Ops" -RestIpAddress "172.16.0.99/24" -ServerCertificate $Certificate 

#Task 4: Verify the deployment
# Note: These steps are duplicated in the detailed steps for this lab because of the complexity of the Windows PowerShell cmdlets.
# 1.At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
$cred=New-Object Microsoft.Windows.Networkcontroller.credentialproperties 

#2. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
$cred.type="usernamepassword" 

#3. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
$cred.username="admin" 

#4. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
$cred.value="abcd" 

#5. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
New-NetworkControllerCredential -ConnectionUri https://LON-SVR2.Adatum.com -Properties $cred –ResourceId cred1 

#6. Press Y, and then press Enter when prompted.
#7. At the Windows PowerShell (Admin) command prompt, type the following command, and then press Enter:
Get-NetworkControllerCredential -ConnectionUri https://LON-SVR2.Adatum.com -ResourceId cred1 

<#
You should receive output that looks similar to the output below:
Tags                   : 
ResourceRef     : /credentials/cred1 
CreatedTime    : 1/1/0001 12:00:00 AM 
InstanceId        : e16ffe62-a701-4d31-915e-7234d4bc5a18 
Etag                  : W/"1ec59631-607f-4d3e-ac78-94b0822f3a9d" 
ResourceMetadata : 
ResourceId       : cred1 
Properties       : Microsoft.Windows.Net
#>