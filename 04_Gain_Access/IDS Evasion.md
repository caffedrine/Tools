# IDS Evasion Techniques

1. Insertion attack - confusing IDS by sending invalid packets - manipulating TTL for each characters from payload such that payload seend by IDS will be differently reconstructed compared to payload received by the target.
2. Evasion - similar to insertion, send packets received only by host but not seen by ids. E.g. TCP handshake packets could bear some data. 
3. DoS Attack - attack ids server
4. Obfuscation
5. False-Poitive Generation - generate noise to cover the real attack
6. Session splicing - split payload in multiple packets to avoid string, pattern, etc matches (!fragmentation, as fragmentation consists of one single packet). Also delay packets to prevent IDS reassambling them after timeout.
7. Unicode evasion - works when e.g. fragmentation between IDS and host differs
8. Fragmentation Attack
9. Overlapping fragments - send fragments with same sequence multiple time with different payload. Target could reassemble it differently than the IDS.
10. Invalid RST Packet
11. Urgency Flag - if this flag is set, first byte of data is lost. If IDS does not respect this, the assembled payload is different.
12. Time-to-live attacks - set time to live for fragments so that not all of the fragments will reach destination and will be misinterpreted by IDS.
13. Polymorphic shellcode
14. ASCII Shellcode
15. Application-Layer Attacks - compress, encrypt, etc such that ids cannot match the data anymore
16. Desynchronization
17. Encryption
18. Flooding - make nois on network so that IDS won't catch the real attack


# Bypassing firewalls

1. Firwalking - locate a firewall location on network using TTL. 
2. Banner grabbing - firewalls does not block banners grabbing usually
3. IP Address Spoofing
4. Source routing
5. Tiny Fragments - make fragments so small that even TCP header is splitted
6. Use IP instead URL
7. Use a proxy server
8. ICMP Tunelling
9. ACK Tunelling
10. HTTP Tunelling
11. SSH and DNS Tunelling
12. Through External Systems
13. Through MitM
14. Through Content
15. Through XSS