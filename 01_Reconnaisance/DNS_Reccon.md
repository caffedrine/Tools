# DNS enum

## All in one: zone transfer + enum + bruteforce
```
$ dnsenum <target_domain>
```

## Attempt zone transfer
```
$ dig axfr <target_domain> @j<nameserver>
```

## Read specific DNS records
```
$ dig -t ns <target_domain>
```

## Brouteforce subdomains and enum
```
$ sublist3r.py -d <target domain>
```
