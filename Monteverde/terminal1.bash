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
