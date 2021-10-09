# Webservers Attacks
## DoS Attacks
## DNS Server Hijacking
## DNS Amplification Attack
## Website misconfiguration
## Phishing Attacks
## Sniffing/MitM Attacks
## Web Cache Poisoning
## SSH Brouteforce Attack
## Web Server PW Cracking
## HTTP Response-Splitting Attack
## Directory Traversal
## Server-Side Request Forgery (SSRF)

# Web application attacks
## Form tampering
## Session hijacking
## Cross-Site Request Forgery
## Cookie tampering
## SQL Injection
## Cros Site Scripting (XSS)
## Command Injection Attacks
## Unvalidated input
## File Injection
## Directory Traversal
## Buffer Overflow
## Source Code Disclosure


# Web servers hacking methodology

## 1. Information gathering
1. whois.net -> get domain info
2. robots.txt

## 2. Web Server Footprinting
1. Banner grabbing, NetCraft, NetCat, etc.

2. HTTP enum using nmap
   a. Discover virtual domains
   ```
   $ nmap -p80 --script hostmap <target>
   ``` 

   b. Discover vulnerable server that uses TRACE:
   ```
   $ nmap -p80 --script http-trace <target>
   ``` 

   c. Harvest email accounts
   ```
   $ nmap -p80 --script http-google-email <target>
   ``` 

   d. Enumerate users domains
   ```
   $ nmap -p80 --script http-userdir-enum <target>
   ``` 

   e. Detect HTTP trace
   ```
   $ nmap -p80 --script http-trace <target>
   ``` 

   f. Check for WAF:
   ```
   $ nmap -p80 --script http-waf-detect <target>
   ``` 

   g. Enum common web applications
   ```
   $ nmap -p80 --script http-enum <target>
   ``` 

   h. Get robots
   ```
   $ nmap -p80 --script http-robots <target>
   ``` 

5. Other nMap enum scripts
   ```
   $ nmap -p80 --script http-frontpage-login <target>
   
   $ nmap -p80 --script http-passwd --script-args 'http-passwd.root = /' <target>
   ``` 

3. Website default credentials from https://cirt.net
4. Find default content of web server
5. Scan with nikto

## 3. Website Mirroring
Copy the entire website using HTTrack or NCollector Studio

## 4. Vulnerability Scanning
1. Acunetix
2. Teneable.io
3. ImmuniWeb
4. Netsparker
5. Fortify WebInspect

## 5. Session Hijacking
1. Burp suite for session guessing, fication, reply, etc.

## 6. Webserver Password Hacking
1. Hashcat
2. THC Hydra


# Web servers attack tools
1. Metasploit
2. 

