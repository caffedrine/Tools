# Telnet enumeration

```console
$ sudo nmap -p23 --script=telnet-ntlm-info <tatget>
$ sudo nmap -p23 --script=telnet-brute <tatget> --script-args userdb=<users_list_file> passdb=<users_passwords_file>
```