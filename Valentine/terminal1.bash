allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ ping 10.10.10.79
PING 10.10.10.79 (10.10.10.79) 56(84) bytes of data.
64 bytes from 10.10.10.79: icmp_seq=1 ttl=63 time=23.2 ms
64 bytes from 10.10.10.79: icmp_seq=2 ttl=63 time=19.9 ms
^C
--- 10.10.10.79 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 3ms
rtt min/avg/max/mdev = 19.916/21.563/23.211/1.654 ms
allenwest1@debian:~/Desktop$ nmap -sV -sC 10.10.10.79
Starting Nmap 7.70 ( https://nmap.org ) at 2020-05-29 15:41 EDT
Nmap scan report for 10.10.10.79
Host is up (0.027s latency).
Not shown: 997 closed ports
PORT    STATE SERVICE  VERSION
22/tcp  open  ssh      OpenSSH 5.9p1 Debian 5ubuntu1.10 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   1024 96:4c:51:42:3c:ba:22:49:20:4d:3e:ec:90:cc:fd:0e (DSA)
|   2048 46:bf:1f:cc:92:4f:1d:a0:42:b3:d2:16:a8:58:31:33 (RSA)
|_  256 e6:2b:25:19:cb:7e:54:cb:0a:b9:ac:16:98:c6:7d:a9 (ECDSA)
80/tcp  open  http     Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
443/tcp open  ssl/http Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
| ssl-cert: Subject: commonName=valentine.htb/organizationName=valentine.htb/stateOrProvinceName=FL/countryName=US
| Not valid before: 2018-02-06T00:45:25
|_Not valid after:  2019-02-06T00:45:25
|_ssl-date: 2020-05-29T19:46:02+00:00; +4m01s from scanner time.
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
|_clock-skew: mean: 4m00s, deviation: 0s, median: 4m00s

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 15.57 seconds
.
.
.
// going to http://10.10.10.79/ shows a hint towards heartbleed vulnerability
// using sslscan we can see it is in fact vulnerable
// Using dirbuster we find /dev as a sub directory
.
.
.
// @ http://10.10.10.79/dev/hyp_key we see a hex encrypted page. 
// Can be found in parent directory to this file.
