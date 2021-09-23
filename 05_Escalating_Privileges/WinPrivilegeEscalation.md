# Windows privilege escalation

## Access powershell history
type C:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt

## Tools:
1. BeRoot
2. LinPostExp

# DLL Hijacking
Simply put, applications will take the closes dll found. If a dll is placed in the same directory with the application it will load it. Therefore it is sucsceptible toexecuting a malicious dll placed in the folder by an attacker.

https://dmcxblue.gitbook.io/red-team-notes/privesc/dll-search-order-hijacking

#### Tools:
1. Dependency Walker

### Tools used to detect hijackable DLLs:
1. Robber - detect which dll is not loaded by full path.4
2. PowerSploit

# Exploiting vulnerabilities

# Exploit Spectre and Meltdown vulnerabilities

Tools to check:
1. InSpectre
2. Spectre & Meltdown Checker

# Named Pipe Impersonation
Named pipes are used to to provide inter-processes communications.

# Exploit misconfigured services
1. Unquoted service paths
2. Service object permissions

3. Unattended Installs - Unattended.xml may contain sensitive info.
In windows, unattended files are stored here:
```
C:/Windows/Panther
C:/Windows/Panther/Unattend
C:/Windows/System32
C:/Windows/System32/sysprep
```

# Pivoting and Relaying on external machines

## Pivoting
Use an external machine to do scans, etc.

## Relaying
route traffic through external machine which have access to target hosts whereas a direct line of communication is not possible.

# Access token manipulation

Windows uses access tokens to determine the ownership of a running process. A user can manipulate access tokens to make a running process appear as though it belongs to someone other than the user that started the process. When this occurs, the process also takes on the security context associated with the new token. For Example, Microsoft promotes the use of access tokens as a security best practice. Administrators should log in as a standard user but run their tools with administrator privileges using the built-in access token manipulation command runas.

https://dmcxblue.gitbook.io/red-team-notes/privesc/access-token-manipulation


# Application shimming

Application Shimming is a technique used on Windows OS that can be used to make the applications developed for the earlier versions of Windows OS still work on the latest version of Windows

https://www.hackingarticles.in/windows-persistence-using-application-shimming/

# Filesystem permissions weakness

Basically replace a binary file that is executed as high-priv because the file has wrong rights configured.

# Path interception

Place malicious application in filesystem in such a way that it would end up being executed instead of the original application.

# Scheduled tasks




