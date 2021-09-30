# Application level session hijacking

1. Session sniffing
2. MitM Attack
3. Predictable session token
4. Main-in-the-Browser Attaxk - use a trojan to intercept browser call, add aplugin, insert a proxy, etc
5. XSS Attacks
6. CSRF Attacks (session riding)
7. Session reply - capture session over the wires and reply it
8. Session fixation - works when server allow a existing session while logging in and it is not generating a new one. An attacker would set-up a session (logging in in his own account - attacker) then inject it in user's broser to be used when lgging in.
9. CRIME (Compresion Ration Info-Leak Made Easy) SSL/TLS Attack - exploit info leaked by compression algorithms.
10. Forbidden Attack - mitm attack when a nonce is used twice - since nonce is the same, generate keys pair.
11. Session donation Attack - send a valid session to target - when target is using website, new session is accepted and linked to user's account.
12. Session hijacking using proxy servers

# Network level session hijack

1. Blind hijacking - attacker inject malicious data into request. It is blind because it cannot see the response as it will be send back to victim.
2. UDP Hijacking - attacker can easily inject packets as this is a conectionless protocol
3. TCP/IP Hijacking - intercept a communicaion between two hosts and pretend to be one of the parties. For this, SEQ number needs to be predicted.
4. RST Hijacking - inject a authentic-looking RSt packet using spoofed source IP
5. MitM
	- using forged ICMP - send error messages to trick server/client route packets through malicious route
	- using ARP Spoofing - reply fraoudulously to ARP requests to trick client send packets through attacker's device.
6. IP Spoofing


