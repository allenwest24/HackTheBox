// I am attempting to test a new tool I've been working on called lazEnum, I haven't published it as of October 2020, but it may be out now. This first part will be from that tool.
.
.
.
kali@kali:~/Desktop/tools$ python ./lazEnum.py 10.10.10.24
** server can't find 24.10.10.10.in-addr.arpa: NXDOMAIN


Welcome to lazEnum! Let's start with a ping check to see if this shit is even reachable first yeh?

PING 10.10.10.24 (10.10.10.24) 56(84) bytes of data.
64 bytes from 10.10.10.24: icmp_seq=1 ttl=63 time=20.5 ms
64 bytes from 10.10.10.24: icmp_seq=2 ttl=63 time=21.4 ms
64 bytes from 10.10.10.24: icmp_seq=3 ttl=63 time=21.5 ms

--- 10.10.10.24 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 20.459/21.139/21.529/0.482 ms

Sick! The server at that IP is up and running. Let's do a port scan. This part may take ages. Trust the system..

Starting Nmap 7.80 ( https://nmap.org ) at 2020-10-12 14:17 EDT
Nmap scan report for 10.10.10.24
Host is up (0.024s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 e9:75:c1:e4:b3:63:3c:93:f2:c6:18:08:36:48:ce:36 (RSA)
|   256 87:00:ab:a9:8f:6f:4b:ba:fb:c6:7a:55:a8:60:b2:68 (ECDSA)
|_  256 b6:1b:5c:a9:26:5c:dc:61:b7:75:90:6c:88:51:6e:54 (ED25519)
80/tcp open  http    nginx 1.10.0 (Ubuntu)
|_http-server-header: nginx/1.10.0 (Ubuntu)
|_http-title:  HTB Hairdresser 
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.36 seconds

Since port 80 is open, lets do a dictionary attack to see if any subdirectories are accessible!
===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.10.24
[+] Threads:        20
[+] Wordlist:       /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Extensions:     php
[+] Timeout:        10s
===============================================================
2020/10/12 14:17:27 Starting gobuster
===============================================================
/uploads (Status: 301)
/exposed.php (Status: 200)
===============================================================
2020/10/12 14:26:46 Finished
===============================================================

SSH is open on port 22 so be looking for usernames and passwords.
Starting a test for 10.10.10.24

Target reachableFound the following ports open:
 22, 80
.
.
.
// Great! Easy first steps, the tool worked like a charm. Now to investigate the web page and all it's found subdirectories.
.
.
.
