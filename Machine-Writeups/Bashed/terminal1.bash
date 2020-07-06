allenwest1@debian:~$ ping 10.10.10.68
PING 10.10.10.68 (10.10.10.68) 56(84) bytes of data.
64 bytes from 10.10.10.68: icmp_seq=1 ttl=63 time=21.3 ms
64 bytes from 10.10.10.68: icmp_seq=2 ttl=63 time=21.8 ms
64 bytes from 10.10.10.68: icmp_seq=3 ttl=63 time=20.4 ms
^C
--- 10.10.10.68 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 12ms
rtt min/avg/max/mdev = 20.383/21.157/21.772/0.590 ms
allenwest1@debian:~$ nmap -sV -sC -A 10.10.10.68
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-19 09:59 EDT
Nmap scan report for 10.10.10.68
Host is up (0.027s latency).                                                                                                                        
Not shown: 999 closed ports                                                                                                                         
PORT   STATE SERVICE VERSION                                                                                                                        
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))                                                                                                 
|_http-server-header: Apache/2.4.18 (Ubuntu)                                                                                                        
|_http-title: Arrexel's Development Site                                                                                                            
                                                                                                                                                    
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .                                                      
Nmap done: 1 IP address (1 host up) scanned in 7.69 seconds  
allenwest1@debian:~$ gobuster -u 10.10.10.68 -w  Desktop/rockyou.txt                                                                                
                                                                                                                                                    
=====================================================                                                                                               
Gobuster v2.0.1              OJ Reeves (@TheColonial)                                                                                               
=====================================================                                                                                               
[+] Mode         : dir                                                                                                                              
[+] Url/Domain   : http://10.10.10.68/                                                                                                              
[+] Threads      : 10                                                                                                                               
[+] Wordlist     : Desktop/rockyou.txt                                                                                                              
[+] Status codes : 200,204,301,302,307,403                                                                                                          
[+] Timeout      : 10s                                                                                                                              
=====================================================
2020/04/19 10:01:03 Starting gobuster
=====================================================
.
.
.
/dev (Status: 301)
.
.
.
=====================================================
2020/04/19 10:07:13 Finished
=====================================================
.
.
.
// Go to http://10.10.10.68/dev/
// --> http://10.10.10.68/dev/phpbash.php
// Continue in bashed/dev/phpbash.bash
.
.
.
