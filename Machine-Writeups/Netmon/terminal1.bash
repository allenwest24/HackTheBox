allenwest1@debian:~$ ping 10.10.10.152
PING 10.10.10.152 (10.10.10.152) 56(84) bytes of data.
64 bytes from 10.10.10.152: icmp_seq=1 ttl=127 time=21.6 ms
64 bytes from 10.10.10.152: icmp_seq=2 ttl=127 time=21.1 ms
64 bytes from 10.10.10.152: icmp_seq=3 ttl=127 time=23.1 ms
64 bytes from 10.10.10.152: icmp_seq=4 ttl=127 time=21.3 ms
^C
--- 10.10.10.152 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 8ms
rtt min/avg/max/mdev = 21.074/21.768/23.076/0.776 ms
allenwest1@debian:~$ nmap -sV -sC -A -Pn 10.10.10.152
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-13 19:48 EDT
Nmap scan report for 10.10.10.152
Host is up (0.84s latency).
Not shown: 995 closed ports
PORT    STATE SERVICE      VERSION
21/tcp  open  ftp          Microsoft ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
| 02-03-19  12:18AM                 1024 .rnd
| 02-25-19  10:15PM       <DIR>          inetpub
| 07-16-16  09:18AM       <DIR>          PerfLogs
| 02-25-19  10:56PM       <DIR>          Program Files
| 02-03-19  12:28AM       <DIR>          Program Files (x86)
| 02-03-19  08:08AM       <DIR>          Users
|_04-13-20  04:01PM       <DIR>          Windows
| ftp-syst: 
|_  SYST: Windows_NT
80/tcp  open  http         Indy httpd 18.1.37.13946 (Paessler PRTG bandwidth monitor)
|_http-server-header: PRTG/18.1.37.13946
| http-title: Welcome | PRTG Network Monitor (NETMON)
|_Requested resource was /index.htm
|_http-trane-info: Problem with XML parsing of /evox/about
135/tcp open  msrpc        Microsoft Windows RPC
139/tcp open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp open  microsoft-ds Microsoft Windows Server 2008 R2 - 2012 microsoft-ds
Service Info: OSs: Windows, Windows Server 2008 R2 - 2012; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 3m07s, deviation: 0s, median: 3m07s
| smb-security-mode: 
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-04-13 19:52:10
|_  start_date: 2020-04-13 13:06:44

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 16.08 seconds
allenwest1@debian:~$ ftp 10.10.10.152
bash: ftp: command not found
allenwest1@debian:~$ sudo apt-get install ftp
[sudo] password for allenwest1: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  ftp
0 upgraded, 1 newly installed, 0 to remove and 155 not upgraded.
Need to get 59.4 kB of archives.
After this operation, 140 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian buster/main amd64 ftp amd64 0.17-34.1 [59.4 kB]
Fetched 59.4 kB in 0s (148 kB/s)
Selecting previously unselected package ftp.
(Reading database ... 246875 files and directories currently installed.)
Preparing to unpack .../ftp_0.17-34.1_amd64.deb ...
Unpacking ftp (0.17-34.1) ...
Setting up ftp (0.17-34.1) ...
update-alternatives: using /usr/bin/netkit-ftp to provide /usr/bin/ftp (ftp) in auto mode
Processing triggers for man-db (2.8.5-2) ...
allenwest1@debian:~$ ftp 10.10.10.152
Connected to 10.10.10.152.
220 Microsoft FTP Service
Name (10.10.10.152:allenwest1): Anonymous
331 Anonymous access allowed, send identity (e-mail name) as password.
Password:
230 User logged in.
Remote system type is Windows_NT.
ftp> ls
200 PORT command successful.
125 Data connection already open; Transfer starting.
02-03-19  12:18AM                 1024 .rnd
02-25-19  10:15PM       <DIR>          inetpub
07-16-16  09:18AM       <DIR>          PerfLogs
02-25-19  10:56PM       <DIR>          Program Files
02-03-19  12:28AM       <DIR>          Program Files (x86)
02-03-19  08:08AM       <DIR>          Users
04-13-20  04:01PM       <DIR>          Windows
226 Transfer complete.
ftp> cat
?Invalid command
ftp> cd Users
250 CWD command successful.
ftp> ls
200 PORT command successful.
125 Data connection already open; Transfer starting.
02-25-19  11:44PM       <DIR>          Administrator
04-13-20  03:28PM       <DIR>          Public
226 Transfer complete.
ftp> cd Public
250 CWD command successful.
ftp> ls
200 PORT command successful.
125 Data connection already open; Transfer starting.
02-03-19  08:05AM       <DIR>          Documents
07-16-16  09:18AM       <DIR>          Downloads
07-16-16  09:18AM       <DIR>          Music
07-16-16  09:18AM       <DIR>          Pictures
04-13-20  03:31PM                   84 tester.txt
02-03-19  12:35AM                   33 user.txt
07-16-16  09:18AM       <DIR>          Videos
226 Transfer complete.
ftp> get user.txt
local: user.txt remote: user.txt
200 PORT command successful.
125 Data connection already open; Transfer starting.
WARNING! 1 bare linefeeds received in ASCII mode
File may not have transferred correctly.
226 Transfer complete.
33 bytes received in 0.02 secs (1.4278 kB/s)
.
.
.
// Now went to terminal 2 to retreive user.txt on my ~/ dir
.
.
.
