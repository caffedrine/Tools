# SMB Enumeration

## List shares

1. Using smbclient
```console
$ smbclient -L  //<target_host>
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
```console
$ smbmap -L -H 10.10.10.27
```

3. Using crackmapexec:
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