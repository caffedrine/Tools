# Website fuzzing

## fuzzing a GET param

```
$ wfuzz -w fuzz_params.txt -b user=34322 -b userrole=admin "http://10.10.10.28/cdn-cgi/login/admin.php?content=accounts&id=FUZZ" # -b user=34322 -b userrole=admin these are cookies
```

## Fuzzing cookies (header)

Only show results with status 200

```
$ wfuzz -w /usr/share/wordlist/general/common.txt -b user=FUZZ -b userrole=admin --filter "(c=200)" http://10.10.10.28/cdn-cgi/login/admin.php?content=uploads
```

## Fuzz multiple params
```
$ wfuzz --filter "(c=200)" -z range,1-12 -z range,1-31 http://intelligence.htb/documents/2020-FUZZ-FUZ2Z-upload.pdf
```

## Official examples
```
wfuzz -c -z file,users.txt -z file,pass.txt --sc 200 http://www.site.com/log.asp?user=FUZZ&pass=FUZ2Z
wfuzz -c -z range,1-10 --hc=BBB http://www.site.com/FUZZ{something not there}
wfuzz --script=robots -z list,robots.txt http://www.webscantest.com/FUZZ
```


## Utils links

https://wfuzz.readthedocs.io/en/latest/user/basicusage.html
https://github.com/gwen001/wfuzz/blob/master/README