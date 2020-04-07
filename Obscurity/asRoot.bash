robert@obscure:~/BetterSSH$ su root
Password: 
root@obscure:/home/robert/BetterSSH# ls
BetterSSH.py
root@obscure:/home/robert/BetterSSH# pwd
/home/robert/BetterSSH
root@obscure:/home/robert/BetterSSH# cd ..
root@obscure:/home/robert# ls
BetterSSH  check.txt  out.txt  passwordreminder.txt  SuperSecureCrypt.py  user.txt
root@obscure:/home/robert# ls -al
total 60
drwxr-xr-x 7 robert robert 4096 Dec  2 09:53 .
drwxr-xr-x 3 root   root   4096 Sep 24  2019 ..
lrwxrwxrwx 1 robert robert    9 Sep 28  2019 .bash_history -> /dev/null
-rw-r--r-- 1 robert robert  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 robert robert 3771 Apr  4  2018 .bashrc
drwxr-xr-x 2 root   root   4096 Dec  2 09:47 BetterSSH
drwx------ 2 robert robert 4096 Oct  3  2019 .cache
-rw-rw-r-- 1 robert robert   94 Sep 26  2019 check.txt
drwxr-x--- 3 robert robert 4096 Dec  2 09:53 .config
drwx------ 3 robert robert 4096 Oct  3  2019 .gnupg
drwxrwxr-x 3 robert robert 4096 Oct  3  2019 .local
-rw-rw-r-- 1 robert robert  185 Oct  4  2019 out.txt
-rw-rw-r-- 1 robert robert   27 Oct  4  2019 passwordreminder.txt
-rw-r--r-- 1 robert robert  807 Apr  4  2018 .profile
-rwxrwxr-x 1 robert robert 2514 Oct  4  2019 SuperSecureCrypt.py
-rwx------ 1 robert robert   33 Sep 25  2019 user.txt
root@obscure:/home/robert# cd
root@obscure:~# pwd
/root
root@obscure:~# ls
root.txt
root@obscure:~# cat root.txt
********************************
root@obscure:~# 
