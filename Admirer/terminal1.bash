allenwest1@debian:~$ ping 10.10.10.187
PING 10.10.10.187 (10.10.10.187) 56(84) bytes of data.
64 bytes from 10.10.10.187: icmp_seq=8 ttl=63 time=23.9 ms
64 bytes from 10.10.10.187: icmp_seq=9 ttl=63 time=21.7 ms
64 bytes from 10.10.10.187: icmp_seq=10 ttl=63 time=22.3 ms
^C
--- 10.10.10.187 ping statistics ---
10 packets transmitted, 3 received, 70% packet loss, time 162ms
rtt min/avg/max/mdev = 21.705/22.628/23.914/0.937 ms
allenwest1@debian:~$ nmap -sV -sC 10.10.10.187
Starting Nmap 7.70 ( https://nmap.org ) at 2020-06-26 11:55 EDT
Nmap scan report for 10.10.10.187
Host is up (0.025s latency).
Not shown: 997 closed ports
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
22/tcp open  ssh     OpenSSH 7.4p1 Debian 10+deb9u7 (protocol 2.0)
| ssh-hostkey: 
|   2048 4a:71:e9:21:63:69:9d:cb:dd:84:02:1a:23:97:e1:b9 (RSA)
|   256 c5:95:b6:21:4d:46:a4:25:55:7a:87:3e:19:a8:e7:02 (ECDSA)
|_  256 d0:2d:dd:d0:5c:42:f8:7b:31:5a:be:57:c4:a9:a7:56 (ED25519)
80/tcp open  http    Apache httpd 2.4.25 ((Debian))
| http-robots.txt: 1 disallowed entry 
|_/admin-dir
|_http-server-header: Apache/2.4.25 (Debian)
|_http-title: Admirer
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.57 seconds
.
.
.
// Went to http://10.10.10.187/ to look around
// Couldn't find much
// Looked back at the scan and saw the disallowed entry in the robots.txt as /admin-dir
.
.
.
allenwest1@debian:~$ gobuster -u http://10.10.10.187/admin-dir -w ./Desktop/directory-list-2.3-medium.txt 

=====================================================
Gobuster v2.0.1              OJ Reeves (@TheColonial)
=====================================================
[+] Mode         : dir
[+] Url/Domain   : http://10.10.10.187/admin-dir/
[+] Threads      : 10
[+] Wordlist     : ./Desktop/directory-list-2.3-medium.txt
[+] Status codes : 200,204,301,302,307,403
[+] Timeout      : 10s
=====================================================
2020/06/26 12:08:28 Starting gobuster
=====================================================
/contact.txt (Status: 200)
/credentials.txt (Status: 200)
=====================================================
2020/06/26 12:12:25 Finished
=====================================================
.
.
.
// Went to them.
// will be logged in .txt files in this writeup directory.

