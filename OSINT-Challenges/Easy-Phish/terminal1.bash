allenwest1@debian:~$ ping secure-startup.com
PING secure-startup.com (184.168.221.54) 56(84) bytes of data.
64 bytes from ip-184-168-221-54.ip.secureserver.net (184.168.221.54): icmp_seq=1 ttl=54 time=139 ms
64 bytes from ip-184-168-221-54.ip.secureserver.net (184.168.221.54): icmp_seq=2 ttl=54 time=78.8 ms
^C
--- secure-startup.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 3ms
rtt min/avg/max/mdev = 78.770/108.825/138.881/30.057 ms
allenwest1@debian:~$ nslookup -type=txt secure-startup.com
Server:         75.75.75.75
Address:        75.75.75.75#53

Non-authoritative answer:
secure-startup.com      text = "v=spf1 a mx ?all - HTB{******************"

Authoritative answers can be found from:

allenwest1@debian:~$ nslookup -type=txt _dmarc.secure-startup.comServer:         75.75.75.75
Address:        75.75.75.75#53

Non-authoritative answer:
_dmarc.secure-startup.com       text = "v=DMARC1;p=none;***************}"

Authoritative answers can be found from:
.
.
.
// Two parts of flag combined to get HTB{*********************************}
.
.
.
