allenwest1@debian:~/Desktop$ ping 10.10.10.8
PING 10.10.10.8 (10.10.10.8) 56(84) bytes of data.
64 bytes from 10.10.10.8: icmp_seq=1 ttl=127 time=26.6 ms
64 bytes from 10.10.10.8: icmp_seq=2 ttl=127 time=25.2 ms
^C
--- 10.10.10.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 11ms
rtt min/avg/max/mdev = 25.168/25.864/26.561/0.714 ms
allenwest1@debian:~/Desktop$ nmap -sV -sC 10.10.10.8
Starting Nmap 7.70 ( https://nmap.org ) at 2020-05-16 14:03 EDT
Nmap scan report for 10.10.10.8
Host is up (0.028s latency).
Not shown: 999 filtered ports
PORT   STATE SERVICE VERSION
80/tcp open  http    HttpFileServer httpd 2.3
|_http-server-header: HFS 2.3
|_http-title: HFS /
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 11.67 seconds
.
.
.
// Went to 10.10.10.8 because it's a webpage
// Found that its running on HttpFileServer 2.3
// Searched for an exploit
// Found one @ https://www.exploit-db.com/exploits/39161
// EDB-ID is 39161
.
.
.
allenwest1@debian:~/Desktop$ searchsploit 39161
[i] Found (#2): /opt/exploit-database/files_exploits.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#2): /opt/exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

---------------------------------------------------------------------------------------------------------- -----------------------------------------
 Exploit Title                                                                                            |  Path
                                                                                                          | (/opt/exploit-database/)
---------------------------------------------------------------------------------------------------------- -----------------------------------------
Rejetto HTTP File Server (HFS) 2.3.x - Remote Command Execution (2)                                       | exploits/windows/remote/39161.py
---------------------------------------------------------------------------------------------------------- -----------------------------------------
Shellcodes: No Result
allenwest1@debian:~/Desktop$ searchsploit -m exploits/windows/remote/39161.py
[i] Found (#2): /opt/exploit-database/files_exploits.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#2): /opt/exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/opt/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

  Exploit: Rejetto HTTP File Server (HFS) 2.3.x - Remote Command Execution (2)
      URL: https://www.exploit-db.com/exploits/39161
     Path: /opt/exploit-database/exploits/windows/remote/39161.py
File Type: Python script, ASCII text executable, with very long lines, with CRLF line terminators

Copied to: /home/allenwest1/Desktop/39161.py


allenwest1@debian:~/Desktop$ ls
39161.py 
allenwest1@debian:~/Desktop$ nano 39161.py 
.
.
.
// Script requires we insert our local IP address.
// script will be saved in the file ../39161.py
.
.
.

