**********@debian:~$ ping 10.10.10.95
PING 10.10.10.95 (10.10.10.95) 56(84) bytes of data.
64 bytes from 10.10.10.95: icmp_seq=1 ttl=127 time=23.10 ms
64 bytes from 10.10.10.95: icmp_seq=2 ttl=127 time=21.8 ms
64 bytes from 10.10.10.95: icmp_seq=3 ttl=127 time=22.1 ms
^C
--- 10.10.10.95 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 13ms
rtt min/avg/max/mdev = 21.813/22.626/23.985/0.982 ms
**********@debian:~$ nmap -sV -A -p- 10.10.10.95
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-05 10:10 EDT
Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
Nmap done: 1 IP address (0 hosts up) scanned in 3.62 seconds
**********@debian:~$ nmap -sV -A -Pn 10.10.10.95
Starting Nmap 7.70 ( https://nmap.org ) at 2020-04-05 10:11 EDT
Nmap scan report for 10.10.10.95
Host is up (0.024s latency).
Not shown: 999 filtered ports
PORT     STATE SERVICE VERSION
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
|_http-favicon: Apache Tomcat
|_http-server-header: Apache-Coyote/1.1
|_http-title: Apache Tomcat/7.0.88

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 14.59 seconds
.
.
.
// From here we go to the only port running (8080) online to see what is happening. --> 10.10.10.95:8080 in url.
// Brings us to the apache welcome page.
// Apache --> Server Status (login was username: admin passwd: admin)
// 
