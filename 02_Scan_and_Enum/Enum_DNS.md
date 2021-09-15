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

# DNS Cache snooping

Query DNS server for specific cached DNS records


1. Non-recursive method
```console
$ dig @<dns_server_ip> <target_domain> A +norecurse
```

2. Recursive method

A low TTL indicate a cached record, which means a user visited target domain recently.

```console
$ dig @<dns_server_ip> <target_domain> A +recurse
```

# DNSSEC zone walking

```console
$ dnsrecon -d www.google.com -z
```

or

```console
$ ldns-walk @<dns_server_ip> <target_domain>
```

Other tools here:
1. ldns
2. dnrecon
3. nsec3map
4. nsec3walker
5. dnswalk

DNSSEC version NSEC3 not succeptible to this attack. 

# Tools

1. dig
2. nslookup
3. dnsrecon
4. dnsenum