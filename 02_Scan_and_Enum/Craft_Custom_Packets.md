1. Creating custom TCP packets using nMap:

```console
$ sudo nmap <target> --data 0xdeadbeef
$ sudo nmap <target> --data-string "hehe"
$ sudo nmap <target> --data-length # Random data with given length
```