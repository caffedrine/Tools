# Website fuzzing

## fuzzing a GET param

```
$ wfuzz -w fuzz_params.txt -b user=34322 -b userrole=admin "http://10.10.10.28/cdn-cgi/login/admin.php?content=accounts&id=FUZZ" # -b user=34322 -b userrole=admin these are cookies
```

## Fuzzing cookies (header)

Only show results with status 200

```
$ wfuzz -w wordlist/general/common.txt -b user=FUZZ -b userrole=admin --filter "(c=200)" http://10.10.10.28/cdn-cgi/login/admin.php?content=uploads
```



## Utils links

https://wfuzz.readthedocs.io/en/latest/user/basicusage.html
https://github.com/gwen001/wfuzz/blob/master/README