allenwest1@debian:~/Desktop$ ping 10.10.10.180
PING 10.10.10.180 (10.10.10.180) 56(84) bytes of data.
64 bytes from 10.10.10.180: icmp_seq=1 ttl=127 time=21.4 ms
64 bytes from 10.10.10.180: icmp_seq=2 ttl=127 time=20.3 ms
64 bytes from 10.10.10.180: icmp_seq=3 ttl=127 time=20.7 ms
^C
--- 10.10.10.180 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 7ms
rtt min/avg/max/mdev = 20.302/20.796/21.354/0.462 ms
allenwest1@debian:~/Desktop$ nmap -sV -sC 10.10.10.180
Starting Nmap 7.70 ( https://nmap.org ) at 2020-07-12 12:26 EDT
Nmap scan report for 10.10.10.180
Host is up (0.039s latency).
Not shown: 993 closed ports
PORT     STATE SERVICE       VERSION
21/tcp   open  ftp           Microsoft ftpd
|_ftp-anon: Anonymous FTP login allowed (FTP code 230)
| ftp-syst: 
|_  SYST: Windows_NT
80/tcp   open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Home - Acme Widgets
111/tcp  open  rpcbind       2-4 (RPC #100000)
| rpcinfo: 
|   program version   port/proto  service
|   100000  2,3,4        111/tcp  rpcbind
|   100000  2,3,4        111/udp  rpcbind
|   100003  2,3         2049/udp  nfs
|   100003  2,3,4       2049/tcp  nfs
|   100005  1,2,3       2049/tcp  mountd
|   100005  1,2,3       2049/udp  mountd
|   100021  1,2,3,4     2049/tcp  nlockmgr
|   100021  1,2,3,4     2049/udp  nlockmgr
|   100024  1           2049/tcp  status
|_  100024  1           2049/udp  status
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
2049/tcp open  mountd        1-3 (RPC #100005)
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 4m52s, deviation: 0s, median: 4m52s
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2020-07-12 12:32:05
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 69.24 seconds
