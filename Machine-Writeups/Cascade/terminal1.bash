allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ ping 10.10.10.182
PING 10.10.10.182 (10.10.10.182) 56(84) bytes of data.
64 bytes from 10.10.10.182: icmp_seq=1 ttl=127 time=19.8 ms
64 bytes from 10.10.10.182: icmp_seq=2 ttl=127 time=20.8 ms
64 bytes from 10.10.10.182: icmp_seq=3 ttl=127 time=23.0 ms
^C
--- 10.10.10.182 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 26ms
rtt min/avg/max/mdev = 19.784/21.219/23.049/1.372 ms
allenwest1@debian:~/Desktop$ nmap -sV -sC 10.10.10.182
Starting Nmap 7.70 ( https://nmap.org ) at 2020-07-08 18:54 EDT
Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
Nmap done: 1 IP address (0 hosts up) scanned in 3.52 seconds
allenwest1@debian:~/Desktop$ nmap -sV -sC -Pn 10.10.10.182
Starting Nmap 7.70 ( https://nmap.org ) at 2020-07-08 18:55 EDT
Nmap scan report for 10.10.10.182
Host is up (0.024s latency).
Not shown: 986 filtered ports
PORT      STATE SERVICE       VERSION
53/tcp    open  domain        Microsoft DNS 6.1.7601 (1DB15D39) (Windows Server 2008 R2 SP1)
| dns-nsid: 
|_  bind.version: Microsoft DNS 6.1.7601 (1DB15D39)
88/tcp    open  kerberos-sec  Microsoft Windows Kerberos (server time: 2020-07-08 23:00:15Z)
135/tcp   open  msrpc         Microsoft Windows RPC
139/tcp   open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp   open  ldap          Microsoft Windows Active Directory LDAP (Domain: cascade.local, Site: Default-First-Site-Name)
445/tcp   open  microsoft-ds?
636/tcp   open  tcpwrapped
3268/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: cascade.local, Site: Default-First-Site-Name)
3269/tcp  open  tcpwrapped
49154/tcp open  msrpc         Microsoft Windows RPC
49155/tcp open  msrpc         Microsoft Windows RPC
49157/tcp open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
49158/tcp open  msrpc         Microsoft Windows RPC
49165/tcp open  msrpc         Microsoft Windows RPC
Service Info: Host: CASC-DC1; OS: Windows; CPE: cpe:/o:microsoft:windows_server_2008:r2:sp1, cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 4m47s, deviation: 0s, median: 4m47s
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled and required
| smb2-time: 
|   date: 2020-07-08 19:01:07
|_  start_date: 2020-07-08 11:47:11

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 149.70 seconds
