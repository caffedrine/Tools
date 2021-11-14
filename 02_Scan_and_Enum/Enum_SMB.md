# SMB Enumeration

## List shares

#### 1. Using smbclient

https://github.com/SecureAuthCorp/impacket

```console
$ smbclient -L //10.10.10.248/Users -U "Tiffany.Molina" -W "intelligence.htb"
$ smbclient -L  //10.10.10.27
Enter WORKGROUP\kali's password: <anything>
        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        backups         Disk
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
SMB1 disabled -- no workgroup available
```
Then, to list a specific share, remove "-L" from command:
```
$ smbclient "//10.10.10.248/Users" -U "Tiffany.Molina" -W "intelligence.htb"
Enter INTELLIGENCE.HTB\Tiffany.Molina's password: 
Try "help" to get a list of possible commands.
smb: \> 

```

#### 2. Using smbmap:

https://github.com/ShawnDEvans/smbmap

Display shares recursively:
```
kali@kali:~/htb/writer$ smbmap -H 10.10.11.101 -R
[+] IP: 10.10.11.101:445        Name: writer.htb
        Disk                                                    Permissions     Comment
        ----                                                    -----------     -------
        print$                                                  NO ACCESS       Printer Drivers
        writer2_project                                         NO ACCESS
        IPC$                                                    NO ACCESS       IPC Service (writer server (Samba, Ubuntu))
kali@kali:~/htb/writer$
```


#### 3. Using crackmapexec:
https://github.com/byt3bl33d3r/CrackMapExec

```console
$ crackmapexec smb <target> --shares
[*] First time use detected
[*] Creating home directory structure
[*] Creating default workspace
[*] Initializing MSSQL protocol database
[*] Initializing WINRM protocol database
[*] Initializing SSH protocol database
[*] Initializing LDAP protocol database
[*] Initializing SMB protocol database
[*] Copying default configuration file
[*] Generating SSL certificate
SMB         <target>     445    ARCHETYPE        [*] Windows Server 2019 Standard 17763 x64 (name:ARCHETYPE) (domain:Archetype) (signing:False) (SMBv1:True)
SMB         <target>     445    ARCHETYPE        [-] Error enumerating shares: SMB SessionError: 0x5b
```

#### 4. Using metasploit
```console
msf5 auziliary(scanner/smb/smb_version)...
```

#### 5. Using **rpcclient**
```
kali@kali:~/htb/writer$ rpcclient -U "" -N 10.10.11.101                   
rpcclient $> enumdomusers                                                 
user:[kyle] rid:[0x3e8]                                                   
rpcclient $> queryuser kyle                                               
        User Name   :   kyle                                              
        Full Name   :   Kyle Travis                                       
        Home Drive  :   \\writer\kyle                                     
        Dir Drive   :                                                     
        Profile Path:   \\writer\kyle\profile                             
        Logon Script:                                                     
        Description :                                                     
        Workstations:                                                     
        Comment     :                                                     
        Remote Dial :                                                     
        Logon Time               :      Thu, 01 Jan 1970 00:00:00 UTC     
        Logoff Time              :      Wed, 06 Feb 2036 15:06:39 UTC     
        Kickoff Time             :      Wed, 06 Feb 2036 15:06:39 UTC     
        Password last set Time   :      Tue, 18 May 2021 17:03:35 UTC     
        Password can change Time :      Tue, 18 May 2021 17:03:35 UTC     
        Password must change Time:      Thu, 14 Sep 30828 02:48:05 UTC    
        unknown_2[0..31]...                                               
        user_rid :      0x3e8                                             
        group_rid:      0x201                                             
        acb_info :      0x00000010                                        
        fields_present: 0x00ffffff                                        
        logon_divs:     168                                               
        bad_password_count:     0x00000000                                
        logon_count:    0x00000000                                        
        padding1[0..7]...                                                 
        logon_hrs[0..21]...                                               
```

Refference: https://bitvijays.github.io/LFF-IPS-P3-Exploitation.html

## View share

```console
$ smbclient //10.10.10.27/backups
Enter WORKGROUP\kali's password:
Try "help" to get a list of possible commands.
smb: \> dir
  .                                   D        0  Mon Jan 20 12:20:57 2020
  ..                                  D        0  Mon Jan 20 12:20:57 2020
  prod.dtsConfig                     AR      609  Mon Jan 20 12:23:02 2020

                10328063 blocks of size 4096. 8239507 blocks available
smb: \>
```

## Download file
```console
$ smbclient //10.10.10.27/backups
Enter WORKGROUP\kali's password:
Try "help" to get a list of possible commands.
smb: \> help
?              allinfo        altname        archive        backup
blocksize      cancel         case_sensitive cd             chmod
chown          close          del            deltree        dir
du             echo           exit           get            getfacl
geteas         hardlink       help           history        iosize
lcd            link           lock           lowercase      ls
l              mask           md             mget           mkdir
more           mput           newer          notify         open
posix          posix_encrypt  posix_open     posix_mkdir    posix_rmdir
posix_unlink   posix_whoami   print          prompt         put
pwd            q              queue          quit           readlink
rd             recurse        reget          rename         reput
rm             rmdir          showacls       setea          setmode
scopy          stat           symlink        tar            tarmode
timeout        translate      unlock         volume         vuid
wdel           logon          listconnect    showconnect    tcon
tdis           tid            utimes         logoff         ..
!
smb: \> dir
  .                                   D        0  Mon Jan 20 12:20:57 2020
  ..                                  D        0  Mon Jan 20 12:20:57 2020
  prod.dtsConfig                     AR      609  Mon Jan 20 12:23:02 2020

                10328063 blocks of size 4096. 8246751 blocks available
smb: \> get prod.dtsConfig
getting file \prod.dtsConfig of size 609 as prod.dtsConfig (0.6 KiloBytes/sec) (average 0.6 KiloBytes/sec)
smb: \> 
```
Cheatsheet:
- https://www.exploit-db.com/docs/48760
- https://book.hacktricks.xyz/pentesting/pentesting-smb