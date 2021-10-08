# Web application attacks

1. Injection
2. Broken authentication
3. Sensitive Data Exposure
4. XML External Entity
5. Broken Acces Control
6. Security Misconfiguration
7. Cross-Site Scripting (XSS)
8. Insecure deserialization
9. Using components with known vulnerabilities
10. Insufficient logging and monitoring

11. Directory traversal
12. Unvalidated redirects and forwards (e.g. redirect to a malicious site)
13. Watering Hole Attacks - exploit website frequently visited by the target and exploit it hoping that target will visit again.
14. XSS
15. CSRF
16. Cookie/Session Poisoning
17. Web Services Attack (exploit a integrated component)
18. Cookie snooping (decode cookie?)
19. Hidden field manipulation
20. Authentication hijacking
21. Obfuscation Application
22. Broken Session Management
23. Broken Account Management
24. DoS
25. Buffer overflow
26. CAPTCHA Attacks
27. Platform attacks
28. Network access attack
29. DMZ Protocol Attack
30. Web-based Timing Attacks (side-channel attacks)
31. MariNet Attack (abuse Service Workers API)
32. RC4 NOMORE Attack
33. Clickjacking Attack
33. JavaScript Hijacking
34. DNS Rebinding Attack

## 1. Injection Flaws
1. SQL Injection
2. LDAP Injection
3. Command injection
	- Shell injection
	- HTML Embedding
	- File Injection
	- Server-side JS Injection
	- Server-side Include Injectyion
	- Server-side Template Injection
	- Log injection
	- HTML Injection
	- CRLF Injection

# Web applications hacking methodology

## 1. Footprint web infrastructure
### a. Server discovery
1. WHOIS Lookup - Netcraft, whois.domaintools.com, who.is
2. DNS Query - tools.dnsstuff.com, network-tools.com
3. Port scanning - nMap, NetScanTools PRO

### b. Service discovery
1. nMap
2. NetScan PRO

### c. Server identification
1. Banner grabbing
	- Telnet/Netcat banner grabbing
	- SSL banner grabbing:
		```
		$ openssl
		> s_client -host google.com -port 443
		```
2. Detecting WAF
	- Using Wafw00f
	```
	$ wafw00f google.com
	```
	- WhatWaf
	- nMap
	- Sheldify WAF Detector

3. Detecting proxies
	Use trace to detect proxies. When packet is bounced back, header will contain "X-Forward-for" or other proxy-specific content.

### d. Hidden content discovery
1. Dir brouteforce - gobuster, owasp zend, burp suite
	```
	$ gobuster dir -w dirs.txt -u http://google.com
	```
2. Website spidering
	```
	$ gospider google.com
	```

### e. Load balancers detection
If target reslves to multiple IPs, there is a load balancer in between
1. Using host
	```
	$ host google.com
	```

2. Using dig
	```
	$ dig google.com
	```

3. Using lbd
	```
	$ lbd google.com
	```

4. Using harlbert
	```
	$ harlberd google.com
	```

## 2. Analyze web applications

## 3. Bypass Client-Sice controls
## 4. Attack auth mechanism
## 5. Attack auth schemes
## 6. Attack ACL
## 7. Attack session management mechanism
## 8. Perform injection attacks
## 9. Attack Application Logic flaws
## 10. Attach shared environment
## 11. Attack Database Connectivity
## 12. Attack web app client
## 13. Attack web services

# Web API, Webhooks, Weh Shells

# Web application security

