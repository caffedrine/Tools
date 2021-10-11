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
#### a. Identify entry point for user inputs
Check how inputs are handled, what heaers are required, etc.

#### b. Identify server-side technologies
USe tools such as **httprint** or **WhatWeb** to identify server technology.

#### c. Identify server-side functionality
Use tools such as wget or nmap to check website capabilities (GET, POST, DELETE) or technologies hat handle the requests.

#### d. Identify files and directories
User tools like **gobuster** or **gospider** to map website directories and files.
Also nMap have script **http-enum** that would do the same thing.

#### e. Identify web applications vulnerabilities
Use a tool such as **vega** or **nessus** to determine whether app contain known vulnerabilities.

#### f. Map the attack surface
Map the attack surface to identify weak points that can be exploited.

## 3. Bypass Client-Side controls
1. Attack hidden forms
2. Attack browser extensions - use extensions to intercept traffic
3. Evade XSS filters
	- Encoding characters (HTML - &#106;, HXX - &#6A;, b64 encoding, padding &#0000006A;, character codes - String.formCharCode(63))
	- Embedding whitespace ( al ert(1337),  &#x109;)
	- Carriage return and newlines (java\nscript)
	- Manipulating tags - (<scr<script>ipt>, <img/src="">, <a onmousedown=alert(1)>)

## 4. Attack auth mechanism

#### a. Design and implementation flaws
1. Bad passwords
2. Broute-force login
3. Verbose failure messages
4. Insecure transmission of credentials
5. Password reset mechanism
6. Forgotten password mechanism
7. Rememberme functionality
8. User impersonation
9. Improper validation
10. Predictable usernames and passwords
11. Insecure distribution of credentials
12. Fail-open login
13. Fail in multistage login mechanism
14. Insecure storage of creds 

#### b. Username enumeration
When entering wrong credentials, check if the message indicate which one is wrong.
- verbose fails messages
- predictable usernames

#### c. Password attacks
- Password changing (send a link to victim to reset passw if CSRF is not working)
- Password recovery
- Remember-me exploit
- Password guessing
- Password brute-forcing
- Tools used: THC-Hydra

#### d. Session attacks
- Session ID predicted
- Session ID bruteforcing
- Session poisoning

#### e. Cookie exploitation
- Cookie poisoning
- Cookie sniffing
- Cookie reply

#### f. Bypass authentication
 - Bypas SML based SSO

## 5. Attack auth schemes
#### a. Uniform resources identifier (URI)
#### b. POST Data
#### c. Query string and cookies
#### d. Parameter tampering
#### e. HTTP Headers
#### f. Hidden tags

## 6. Attack ACL
1. Attack with different user account
2. Attack multistage process
3. Attack static resources
4. Attack direct access to methods
5. Attack restrictions on HTTP methods

## 7. Attack session management mechanism
1. Session token prediction
2. Session token tampering
3. MitM
4. Session Hijacking
5. Session reply


## 8. Perform injection attacks
1. Web script injection
2. OS Command Injection
3. SMTP Injection
4. SQL Injection
5. LDAP Injection
6. XPath Injection
7. Buffer overflow
8. File Injection
9. Canonicalization

#### LFI Example
1. Use  %00 or ? to end path parsing: test.txt%00.php would end up in test.txt

## 9. Attack Application Logic flaws
Exploit application logic which does not have a specific signature and thus cannot be easily scanned.

## 10. Attach shared environment

## 11. Attack Database Connectivity
#### Connection string injection
```
$db = $_POST['db'];
$conn = new PDO("mysql:host=myWebHost.com;dbname={$db}", $user, $pass);
```
#### Connction string parameter pollution
1. Hash stealing (connect to a rogue sql server)
2. Port scanning (try to connect to a specific port)
3. Hijack Web Credentials

#### Connection pool DsS
Craft a very big query  and run it multiple times to consume resources on server.


Full info: https://www.blackhat.com/presentations/bh-dc-10/Alonso_Chema/Blackhat-DC-2010-Alonso-Connection-String-Parameter-Pollution-wp.pdf

## 12. Attack web app client
1. XSS
2. HTTP Header injection
3. Request Forgery Attack
4. Privacy Attacks (performed with help of an insider)
5. Redirection attacks
6. Frame injection
7. Session fixation
8. ActiveX Attacks?

## 13. Attack web services
1. Web service probbing
2. Soap injection
3. Soap Action Spoofing
4. WS-Address Spoofing
5. XML Injection

Tools:
- WS-Attacker

## Web applications Hacking Tools:
1. Metasploit
2. w3af
3. Nikto
4. Sn1per
5. WSSiP
6. X Attacker
7. timing_attack

# Web API
## OWASP Top 10 API security risks:
- Broken object level authorization
- Broken user authentication
- Excessive data exposure
- lack of resources and rate limiting
- broken function-level auth
- mass assignment
- security misconfig
- injection
- improper assets management
- insufficient logging

## API Vulnerabilities
- Resource enum
- Share res via unsafe url
- Vulnerabilities in libs used
- improper use of cors
- code injection
- RBAC Privilege escalation
- no ABAC validation
- business logic flaws

## Web API Hacking Methodology
#### 1. Identify target
- From header
- From message formats

#### 2. Detect security standards used
- SOAP
- RestAPI
- oAuth
- OpenID

#### 3. Identify attack surface
- Find inputs and try to manipulate them
- API Discovery
- Bruteforce

#### 4. Launch attack
1. fuzzing
2. Invalid inputs length
3. Malicious input attacks
4. Injection attacks
5. Insecure SSL config
6. Insecure direct object ref
7. Insecure session/auth handling
8. Credential stuffing attacks (reuse)
9. DoS
10. Auth attacks on aPI
11. Reverse engineering
12. Use spoofing
13. MitM
14. Session reply
15. Social engineering

# Web shells



# Web application security

