# I. Types of SQL Injection
Useful resources:
- https://github.com/payloadbox/sql-injection-payload-list

## A. In-Band SQL Injection
Attacker use the same chanel to query and read results.

#### 1. Error-based SQL Injection
Insert bad inputs to cause SQL server to return errors. Then exploit input to query for multiple results.

#### 2. System Stored procedure
Modify stored queries.

#### 3. Logically incorrect query
Use logically incorrect queries (add " after input) to make query invalid on purpose. Usually a error message will show info regarding resulted SQL statement.

#### 4. UNION SQL Injection
Use UNION to join multiple results to the original query results.

#### 5. Tautology
Make query be always true: ' OR 1=1 --

#### 6. End-of-line comment
Make use of --

#### 7. In-line comment
Make use of /* comment here \*/

#### 8. Piggybacked/Stacked query
Attacker may use ';' to append a second query to initial query.

## B.  Blind/Inferential SQL Injection
- No errors display. Attackers is carried in boolean form.
- No error message - Results of the query are not directly visible for the attacker.
- Generic page - A generic error message will be returned actually, which does not provide rich info for attacker.
- Time-intensive/Time-based SQL Injection - Insert a delay before response to know if the query succeed. 

#### 1. WAIT DELAY (Y/N) / Time-based SQL Injection
Insert a time delay after positive response to know if query succeed.

#### 2. Boolean exploitation
Send multiple queries which are evaluated as true or false and gether info by comparing response pages whether query succeed.

#### 3. Heavy query
Perform time delayed query without time-specific function bu rather by asking intense operations when query succeed. Heavy query can be generated using multiple queries joined.


## C. Out-of-band SQL Injection
Different communication channels such as file write, http request, email functionality etc.

For this to succeed, attacker need to communicate with SQL server and acquire features uspported.

DNS or HTTP could be used to exfiltrate data.

# II. SQL Injection Methodology

## 1. Extract info from error messages
- Tamper parameter to cause any error and capture any usefull data
- Determine datbase engine by generating ODBC errors
- determine query SELECT structure - by placing ' before, after, to different param, etc
- get info from groupping error - **' GROUP BY col_name HAVING 1=1--**
- type mismatch errors - used to determine the type of a field inside a table - **UNION SELECT 1,2,'text',3,4 --**
- blind injection - **; IF <condition> WAITFOR DELAY '0:0:5'--**

## 2. SQL Injection Detection
1. Function testing - feed a function with various inputs
2. Fuzz testing
3. Code analysis

Example iputs vectors to be concat to actual query string:
```
||6 
'||'6 
(||6) 
' OR 1=1--
OR 1=1 
or 1=1--
" or "a"="a 
Admin' OR ' 
' having 1=1--' 
OR 'text' = N'text'
%22+or+isnull%281%2F0% 29+%2F*
' group by userid having 1=1--
'; EXECUTE IMMEDIATE 'SEL' || 'ECT US' || 'ER'
CRATE USER name IDENTIFIED BY 'pass123' 
' union select 1,load_file('/etc/passwd'),
' or 1 in (select @@version)--
' union all select @@version--
' OR 'unusual' = 'unusual'
' OR 'something' = 'some'+'thing'
' OR 'something' like 'some%'
+or+isnull%281%2F0 %29+%2F*
%27+OR+%277659% 27%3D%277659
%22+or+isnull%281 %2F0%29+%2F*
' and 1 in (select var from temp)--
' ; drop table temp --

' OR '1'='1 
; OR '1'='1' 
%27+--+ 
" or 1=1--' 
or 1=1 /* 
' OR 2 > 1 
' OR 'text' > 't' 
' union select 
Password:*/=1--
' or 1/*
```

Full payloads list here: https://github.com/payloadbox/sql-injection-payload-list


## 3. Perforn SQL Injection attack

#### a. Perform Union SQL Injection
a. Extract database name
b. Extract Database tables
c. Extract Table column Names
d. Extract data


#### b. 



# III. SQL Injection Tools

# IV. Evasion techniques

