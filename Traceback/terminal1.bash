allenwest1@debian:~$ ping 10.10.10.181
PING 10.10.10.181 (10.10.10.181) 56(84) bytes of data.
64 bytes from 10.10.10.181: icmp_seq=28 ttl=63 time=21.2 ms
64 bytes from 10.10.10.181: icmp_seq=29 ttl=63 time=22.5 ms
64 bytes from 10.10.10.181: icmp_seq=30 ttl=63 time=22.1 ms
^C
--- 10.10.10.181 ping statistics ---
30 packets transmitted, 3 received, 90% packet loss, time 660ms
rtt min/avg/max/mdev = 21.206/21.954/22.544/0.570 ms
allenwest1@debian:~$ nmap -sV -sC -A -Pn 10.10.10.181
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-08 11:38 EDT
Nmap scan report for 10.10.10.181
Host is up (0.034s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 96:25:51:8e:6c:83:07:48:ce:11:4b:1f:e5:6d:8a:28 (RSA)
|   256 54:bd:46:71:14:bd:b2:42:a1:b6:b0:2d:94:14:3b:0d (ECDSA)
|_  256 4d:c3:f8:52:b8:85:ec:9c:3e:4d:57:2c:4a:82:fd:86 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: Help us
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.08 seconds
