## MsSQL Enable 'xp_cmdshell'

```console
SQL> EXEC sp_configure 'Show Advanced Options', 1;
SQL> reconfigure;
SQL> sp_configure;
SQL> EXEC sp_configure 'xp_cmdshell', 1
SQL> reconfigure;
SQL> xp_cmdshell "whoami"
```