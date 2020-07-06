allenwest1@debian:~$ ssh robert@10.10.10.168
robert@10.10.10.168's password: 
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-65-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Apr  7 18:55:48 UTC 2020

  System load:  0.0               Processes:             106
  Usage of /:   45.9% of 9.78GB   Users logged in:       1
  Memory usage: 10%               IP address for ens160: 10.10.10.168
  Swap usage:   0%


 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

40 packages can be updated.
0 updates are security updates.

Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings


Last login: Tue Apr  7 18:43:28 2020 from 10.10.14.5
robert@obscure:~$ ls
BetterSSH  check.txt  out.txt  passwordreminder.txt  SuperSecureCrypt.py  user.txt
robert@obscure:~$ cd BetterSSH/
robert@obscure:~/BetterSSH$ ls
BetterSSH.py
robert@obscure:~/BetterSSH$ /usr/bin/sudo /usr/bin/python3 /home/robert/BetterSSH/BetterSSH.py 
Enter username: random
Enter password: random
Invalid user
robert@obscure:~/BetterSSH$ exit
logout
Connection to 10.10.10.168 closed.
allenwest1@debian:~$ nano hash.txt
allenwest1@debian:~$ sudo john -w=./Desktop/rockyou.txt hash.txt
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Press 'q' or Ctrl-C to abort, almost any other key for status
.
.
.
// Turned out to be 'mercedes'
