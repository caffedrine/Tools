# covering tracks on windows

## 1. Disable auditing

Auditpol.exe

```
# disable/enable auditing
C:\> auditpol /set /category:"system","account logon" /success:enable /failure:enable

# Read auditing status
C:\> auditpol /get /category:*
```

## 2. Clearing Logs 

### Clear logs using Clear_event_Viewer_Logs.bat
https://www.tenforums.com/tutorials/16588-clear-all-event-logs-event-viewer-windows.html

Clear_event_Viewer_Logs.bat:
```
@echo off

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.
echo All Event Logs have been cleared!
goto theEnd

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:noAdmin
echo Current user permissions to execute this .BAT file are inadequate.
echo This .BAT file must be run with administrative privileges.
echo Exit now, right click on this .BAT file, and select "Run as administrator".  
pause >nul

:theEnd
Exit
```

### Clear logs using meterpreter shell

### Clear logs using PowerShell

Delete logs using Clear-EventLog command on powershell as an administrator

```
# clear local powershell event logs
> Clear-EventLog "Windows PowerShell"

# Delete multiple log types local or remote
> Clear-EventLog -LogName ODiag, OSession -ComputerName localhost, Server10

# Clear all logs on specified system
> Clear-EventLog -LogName application, system -confirm

```

### Clear logs using wevutil utility

```
# List event logs
C:\> wevutil cl

# Delete specific event 
C:\> wevutil cl <log_name> # log name: system, application security
```

### Clear logs manually

Start >> Control Panel >> System and Security >> Administrative Tools >> Event-Viewer

## 3. Covering tracks on the OS

Using Alternative Data Streams

## 4. Deleting files

Delete files using cipher.exe - this will permanently delete selected files.

## 5. Disabling Windows unctionalities

1. Disable last access timestams usinf **fsutil**
2. Disable windows hibernation from registry as Hiberfil.sys is a hidden file containin RAM info that could have info regarding attacker.
3. Disable windows virtual memory (paging file) - used as a compensation when RAM is not enough
4. Disable system restore points - this contains data about previously restored files
5. Disable windows thumbnail cache (thumbs.db) - conaints info about files previously used/deleted on the system.
6. Disable windows prefetch feature - this store specific data about applications that are typically used.

# Tracks covering tools

1. CCleaner
2. DBAN
3. Privacy Eraser
4. Wipe
5. BleachBit
6. clear Prog