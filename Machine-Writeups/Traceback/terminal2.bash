allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ nano authorized_keys
allenwest1@debian:~/Desktop$ nano id_rsa

allenwest1@debian:~/Desktop$ ssh -i id_rsa webadmin@10.10.10.181
#################################
-------- OWNED BY XH4H  ---------
- I guess stuff could have been configured better ^^ -
#################################
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'id_rsa' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "id_rsa": bad permissions
webadmin@10.10.10.181's password: 
Permission denied, please try again.
webadmin@10.10.10.181's password: 
Permission denied, please try again.
webadmin@10.10.10.181's password: 
webadmin@10.10.10.181: Permission denied (publickey,password).
allenwest1@debian:~/Desktop$ ssh -i id_rsa webadmin@10.10.10.181
#################################
-------- OWNED BY XH4H  ---------
- I guess stuff could have been configured better ^^ -
#################################
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'id_rsa' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "id_rsa": bad permissions
webadmin@10.10.10.181's password: 
Permission denied, please try again.
webadmin@10.10.10.181's password: 

allenwest1@debian:~/Desktop$ ls -al 
total 136768
drwxr-xr-x  6 allenwest1 allenwest1      4096 Apr  9 00:10 .
drwxr-xr-x 20 allenwest1 allenwest1      4096 Apr  8 23:34 ..
drwxr-xr-x  2 allenwest1 allenwest1      4096 Dec 17 22:40 advent_of_cod
-rw-r--r--  1 allenwest1 allenwest1       399 Apr  9 00:09 authorized_keys
-rw-r--r--  1 allenwest1 allenwest1        90 Apr  1 16:58 computer.desktop
drwxr-xr-x  3 allenwest1 allenwest1      4096 Jan 13 15:10 EthicalHack
-rw-r--r--  1 allenwest1 allenwest1        27 Apr  1 17:09 exploitReference.txt
-rw-r--r--  1 allenwest1 allenwest1       238 Apr  1 12:42 hacktheboxbs
drwxr-xr-x  3 allenwest1 allenwest1      4096 Apr  2 11:18 home
-rw-r--r--  1 allenwest1 allenwest1      1877 Apr  9 00:10 id_rsa
-rw-------  1 allenwest1 allenwest1      1766 Apr  3 14:27 joanna.pen
-rwxr-xr-x  1 allenwest1 allenwest1      5495 Apr  1 17:33 msfinstall
-rw-r--r--  1 allenwest1 allenwest1        94 Apr  1 16:58 network.desktop
-rw-r--r--  1 allenwest1 allenwest1       526 Apr  1 17:15 nmap_scan.gnmap
-rw-r--r--  1 allenwest1 allenwest1      1551 Apr  1 17:15 nmap_scan.nmap
-rw-r--r--  1 allenwest1 allenwest1      8979 Apr  1 17:15 nmap_scan.xml
-rwxr-xr-x  1 allenwest1 allenwest1       274 Apr  3 13:17 openNetAdmin.sh
-rw-r--r--  1 allenwest1 allenwest1       609 Apr  1 15:07 prod.dtsConfig
-rwxr-xr-x  1 allenwest1 allenwest1      2940 Mar 31 14:24 Prog8.jar
-rw-r--r--  1 allenwest1 allenwest1       332 Apr  1 12:02 Prog8RE.java
-rw-r--r--  1 allenwest1 allenwest1      9477 Apr  1 17:06 pwn3yb0i.ovpn
-rw-r--r--  1 allenwest1 allenwest1 139921497 Apr  2 13:58 rockyou.txt
-rw-r--r--  1 allenwest1 allenwest1       682 Apr  1 17:29 .searchsploit_rc
-rw-r--r--  1 allenwest1 allenwest1       445 Apr  7 14:12 shell.py
drwxr-xr-x  2 allenwest1 allenwest1      4096 Nov 15 01:02 Tint
-rw-r--r--  1 allenwest1 allenwest1       102 Apr  2 13:49 trash-can.desktop
-rw-r--r--  1 allenwest1 allenwest1        97 Apr  1 16:58 user-home.desktop
allenwest1@debian:~/Desktop$ chmod 600 id_rsa 
allenwest1@debian:~/Desktop$ ssh -i id_rsa webadmin@10.10.10.181
#################################
-------- OWNED BY XH4H  ---------
- I guess stuff could have been configured better ^^ -
#################################
Enter passphrase for key 'id_rsa': 

Welcome to Xh4H land 



Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Wed Apr  8 20:37:07 2020 from 10.10.16.94
.
.
.
// Rest in asWebadmin.bash
