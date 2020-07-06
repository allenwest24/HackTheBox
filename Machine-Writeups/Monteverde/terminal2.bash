allenwest1@debian:~/Desktop$ cat azure.xml 
��<Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04">
  <Obj RefId="0">
    <TN RefId="0">
      <T>Microsoft.Azure.Commands.ActiveDirectory.PSADPasswordCredential</T>
      <T>System.Object</T>
    </TN>
    <ToString>Microsoft.Azure.Commands.ActiveDirectory.PSADPasswordCredential</ToString>
    <Props>
      <DT N="StartDate">2020-01-03T05:35:00.7562298-08:00</DT>
      <DT N="EndDate">2054-01-03T05:35:00.7562298-08:00</DT>
      <G N="KeyId">00000000-0000-0000-0000-000000000000</G>
      <S N="Password">4n0therD4y@n0th3r$</S>
    </Props>
  </Obj>
</Objs>
.
.
.
// mhope:4n0therD4y@n0th3r$
// Took a few days break because I couldn't get evil-winrm to work but it does now.
.
.
.
allenwest1@debian:~/Desktop$ ping 10.10.10.172
PING 10.10.10.172 (10.10.10.172) 56(84) bytes of data.
64 bytes from 10.10.10.172: icmp_seq=20 ttl=127 time=309 ms
64 bytes from 10.10.10.172: icmp_seq=21 ttl=127 time=102 ms
^C
--- 10.10.10.172 ping statistics ---
22 packets transmitted, 2 received, 90.9091% packet loss, time 556ms
rtt min/avg/max/mdev = 101.724/205.360/308.997/103.637 ms
.
.
.
// Continue in asMhope.bash
