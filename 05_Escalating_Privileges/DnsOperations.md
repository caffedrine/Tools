# nsupdate

#### Add dns record

```
$ nsupdate -k /etc/bind/infra.key

> update add test.infra.domain.com 86400 A <YOUR IP>

> update add <YOUR IP IN REVERSE>.in-addr.arpa 86400 PTR test.infra.domain.com

> show

> send

> quit

```