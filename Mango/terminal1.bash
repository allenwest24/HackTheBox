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
