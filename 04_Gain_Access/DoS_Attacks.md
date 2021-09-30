# Denial of Service (DoS) Attacks

## Categories
1. Volumetric
2. Protocol Attack
3. Application Attack

## Techniques:
1. UDP Flood - send UDP packets with spoofed IP
2. ICMP Attack - send ICMP ECHO packets to target
3. Ping of Death - send malformed oversized ping packets to make systems crash
4. Smurf Attack DDoS Attack- send ICMP ECHO packets with spoofed IP so that host will send replied to the spoofed IP.
5. Pulse Wave DDoS Attack - periodic (e.g. every 10 minutes) attacks with high volume
6. Zero-Day DDoS Attacks - exploit unpatched vulnerabilities to disrupt services
7. SYN Flood Attack - send larde number of SYN requests with fake IP address (ACK connection is tracked by server for 75s)
	- SYN-ACK Flood Attack - send a large number of SYN-ACK requests
	- ACK/PUSH ACK Flood Attack - send large number of ACK and PUSH ACK to the target
8. Fragmentation Attack - send large number of fragmented packets (1500+ bytes per fragment) with a relatively small packet rate. Reassembly pf these packets will consume lots of resources
9. Spoofed Session Flood Attack - send fake TCP sessions to bypass firewall.
10. HTTP/GET Flood - layer 7 attack by sending web requests - use a time-delay header to make web server wais as much a spossible for the request so it will have it's resources blocked waiting for data.
	- single-session attack - bombard server with multiple requests in same session in HTTP 1.1
	- single-request attack - 
	- recursive HTTP GET attack - read server resources randomly (e.g. images, etc)
	- random recursive GET attack - request different page, link each time to look like legitimate user browsing
11. Slowloris Attack - send partial HTTP requests to web page to keep HTTP session open as much as possible to exceed maximum concurrent connections pool

12. UDP Application Layer Flood
13. Multi-Vector Flood Attack - combination of volumetric protocol attack and application lyer attacks.
14. Peer-to-Peer Attack - exploit bugs in peer-to-peer applications (e.g. DC++) and instruct clients to connect to target server
15. Permanent DOS Attack (Phlashing) - target hardware
16. Distributed Reflection DoS (DRDoS)