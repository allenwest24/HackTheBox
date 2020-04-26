allenwest1@debian:~$ ping 10.10.10.56
PING 10.10.10.56 (10.10.10.56) 56(84) bytes of data.
64 bytes from 10.10.10.56: icmp_seq=9 ttl=63 time=308 ms
64 bytes from 10.10.10.56: icmp_seq=10 ttl=63 time=25.8 ms
^C
--- 10.10.10.56 ping statistics ---
10 packets transmitted, 2 received, 80% packet loss, time 214ms
rtt min/avg/max/mdev = 25.793/167.122/308.451/141.329 ms
allenwest1@debian:~$ nmap 10.10.10.56
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-26 12:53 EDT
Nmap scan report for 10.10.10.56
Host is up (0.028s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
80/tcp   open  http
2222/tcp open  EtherNetIP-1

Nmap done: 1 IP address (1 host up) scanned in 0.52 seconds
