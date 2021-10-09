# SMB Enumeration



## List shares

1. Using smbclient

https://github.com/SecureAuthCorp/impacket

```console
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

2. Using smbmap:

https://github.com/ShawnDEvans/smbmap

```console
$ smbmap -L -H 10.10.10.27
```

3. Using crackmapexec:
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

3. Using metasploit
```console
msf5 auziliary(scanner/smb/smb_version)...
```

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