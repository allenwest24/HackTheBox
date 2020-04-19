allenwest1@debian:~$ ping 10.10.10.15
PING 10.10.10.15 (10.10.10.15) 56(84) bytes of data.
64 bytes from 10.10.10.15: icmp_seq=1 ttl=127 time=22.4 ms
64 bytes from 10.10.10.15: icmp_seq=2 ttl=127 time=20.5 ms
^C
--- 10.10.10.15 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 10ms
rtt min/avg/max/mdev = 20.510/21.442/22.375/0.943 ms
allenwest1@debian:~$ nmap -sV -sC -Pn 10.10.10.15
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-18 22:41 EDT
Nmap scan report for 10.10.10.15
Host is up (0.022s latency).
Not shown: 999 filtered ports
PORT   STATE SERVICE VERSION
80/tcp open  http    Microsoft IIS httpd 6.0
| http-methods: 
|_  Potentially risky methods: TRACE DELETE COPY MOVE PROPFIND PROPPATCH SEARCH MKCOL LOCK UNLOCK PUT
|_http-server-header: Microsoft-IIS/6.0
|_http-title: Under Construction
| http-webdav-scan: 
|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, DELETE, COPY, MOVE, PROPFIND, PROPPATCH, SEARCH, MKCOL, LOCK, UNLOCK
|   WebDAV type: Unkown
|   Server Date: Sun, 19 Apr 2020 02:44:40 GMT
|   Server Type: Microsoft-IIS/6.0
|_  Public Options: OPTIONS, TRACE, GET, HEAD, DELETE, PUT, POST, COPY, MOVE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, SEARCH
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.00 seconds
allenwest1@debian:~$ msfconsole
Found a database at /home/allenwest1/.msf4/db, checking to see if it is started
Starting database at /home/allenwest1/.msf4/db...success
[?] Initial MSF web service account username? [allenwest1]: 
[?] Initial MSF web service account password? (Leave blank for random password): 
Generating SSL key and certificate for MSF web service
MSF web service PID file found, but no active process running as PID 2667
Deleting MSF web service PID file /home/allenwest1/.msf4/msf-ws.pid
Attempting to start MSF web service...failed
[!] MSF web service appears to be started, but may not operate as expected.
MSF web service expects authentication. If you wish to reinitialize the web service account you will need to reinitialize the database.
Please see /home/allenwest1/.msf4/logs/msf-ws.log for additional details.
This copy of metasploit-framework is more than two weeks old.
 Consider running 'msfupdate' to update to the latest version.
                                                  
     ,           ,
    /             \                                                                                                                                 
   ((__---,,,---__))                                                                                                                                
      (_) O O (_)_________                                                                                                                          
         \ _ /            |\                                                                                                                        
          o_o \   M S F   | \                                                                                                                       
               \   _____  |  *                                                                                                                      
                |||   WW|||                                                                                                                         
                |||     |||                                                                                                                         
                                                                                                                                                    

       =[ metasploit v5.0.83-dev-                         ]
+ -- --=[ 1991 exploits - 1088 auxiliary - 340 post       ]
+ -- --=[ 560 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: After running db_nmap, be sure to check out the result of hosts and services
.
.
.
// Searched for the exploit online and found a good'n
.
.
.

