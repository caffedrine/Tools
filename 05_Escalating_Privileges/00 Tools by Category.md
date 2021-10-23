## Analyze local files

#### 1. DumpsterDriver

DumpsterDiver is a tool, which can analyze big volumes of data in search of hardcoded secrets like keys (e.g. AWS Access Key, Azure Share Key or SSH keys) or passwords. Additionally, it allows creating a simple search rules with basic conditions (e.g. report only csv files including at least 10 email addresses). The main idea of this tool is to detect any potential secret leaks. You can watch it in action in the demo video or read about all its features in this article.

Usage:
```
usage: DumpsterDiver.py [-h] -p LOCAL_PATH [-r] [-a] [-s] [-o OUTFILE]
                        [--min-key MIN_KEY] [--max-key MAX_KEY]
                        [--entropy ENTROPY] [--min-pass MIN_PASS]
                        [--max-pass MAX_PASS]
                        [--pass-complex {1,2,3,4,5,6,7,8,9}]
                        [--exclude-files EXCLUDE_FILES [EXCLUDE_FILES ...]]
                        [--bad-expressions BAD_EXPRESSIONS [BAD_EXPRESSIONS ...]]
```

Practical usage:
```
$ python3 DumpsterDiver.py  ...
```


Link: https://github.com/securing/DumpsterDiver