## Windows LLMNR/NBT-NS Poisoning 

Responder.py can be used to performthis attack:

```console
$ Responder.py -I wlan0
```

## Steps

1. User try to connect to a wrong  data-sharing system, e.g. \\Tools-Drive
2. DataServer responds back to the use saying that it do not have that host names \\Tools-Drive
3. USers sends a LLMNR/NBt-NS broadcast on port UDP 5355/ TCP 137 asking if anyone know that host
4. Responder replies back sayng that it have \\Tools-Drive and accepts user's NTLMv2 hash.

## Tools to detect poisoning
1. Vindicate
2. got-responded
3. Respunder