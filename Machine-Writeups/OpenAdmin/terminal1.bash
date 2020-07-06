allenwest1@debian:~/Desktop$ ping 10.10.10.171
PING 10.10.10.171 (10.10.10.171) 56(84) bytes of data.
64 bytes from 10.10.10.171: icmp_seq=1 ttl=63 time=24.5 ms
64 bytes from 10.10.10.171: icmp_seq=2 ttl=63 time=25.0 ms
64 bytes from 10.10.10.171: icmp_seq=3 ttl=63 time=23.8 ms
^C
--- 10.10.10.171 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 16ms
rtt min/avg/max/mdev = 23.766/24.418/25.007/0.539 ms
allenwest1@debian:~/Desktop$ nmap -sV -sC 10.10.10.171
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-02 13:51 EDT
Nmap scan report for 10.10.10.171
Host is up (0.027s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 4b:98:df:85:d1:7e:f0:3d:da:48:cd:bc:92:00:b7:54 (RSA)
|   256 dc:eb:3d:c9:44:d1:18:b1:22:b4:cf:de:bd:6c:7a:54 (ECDSA)
|_  256 dc:ad:ca:3c:11:31:5b:6f:e6:a4:89:34:7c:9b:e5:50 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.19 seconds
$ gobuster dir -w ~/Desktop/rockyou.txt -u 10.10.10.171
.
.
.
// This resulted in nothing and was way more effort than it was worth. 
// It did, however give me addresses within the site to explore where we found the 
// version was v18.1.1.
// Switching to other terminal so I can try to find an exploit.
