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
.
.
.
// Went to 10.10.10.181
// Checked out the source @ view-source:http://10.10.10.181/
// Found the line: "<!--Some of the best web shells that you might need ;)-->"
// Searched it and it led to a site with a list of php scripts.
.
.
.
allenwest1@debian:~$ nano shell.txt
allenwest1@debian:~$ wfuzz -c -z file,'shell.txt' http://10.10.10.181/FUZZ

Warning: Pycurl is not compiled against Openssl. Wfuzz might not work correctly when fuzzing SSL sites. Check Wfuzz's documentation for more information.

********************************************************
* Wfuzz 2.3.4 - The Web Fuzzer                         *
********************************************************

Target: http://10.10.10.181/FUZZ
Total requests: 20

==================================================================
ID   Response   Lines      Word         Chars          Payload    
==================================================================

000001:  C=404      9 L       32 W          285 Ch        "alfa3.php"
000002:  C=404      9 L       32 W          290 Ch        "alfav3.0.1.php"
000003:  C=404      9 L       32 W          286 Ch        "andela.php"
000004:  C=404      9 L       32 W          290 Ch        "bloodsecv4.php"
000005:  C=404      9 L       32 W          282 Ch        "by.php"
000006:  C=404      9 L       32 W          285 Ch        "c99ud.php"
000011:  C=404      9 L       32 W          301 Ch        "obfuscated-punknopass.php"
000012:  C=404      9 L       32 W          291 Ch        "punk-nopass.php"
000013:  C=404      9 L       32 W          289 Ch        "punkholic.php"
000014:  C=404      9 L       32 W          283 Ch        "r57.php"
000016:  C=404      9 L       32 W          288 Ch        "wso2.8.5.php"
000015:  C=200     58 L      100 W         1261 Ch        "smevk.php"
000018:  C=404      9 L       32 W          280 Ch        "FREE"
000019:  C=404      9 L       32 W          287 Ch        "INTERNETZZZ"
000017:  C=404      9 L       32 W          280 Ch        "Xh4H"
000020:  C=200     44 L      151 W         1113 Ch        ""
000007:  C=404      9 L       32 W          283 Ch        "cmd.php"
000009:  C=404      9 L       32 W          288 Ch        "jspshell.jsp"
000008:  C=404      9 L       32 W          299 Ch        "configkillerionkros.php"
000010:  C=404      9 L       32 W          284 Ch        "mini.php"

Total time: 2.085044
Processed Requests: 20
Filtered Requests: 0
Requests/sec.: 9.592121
