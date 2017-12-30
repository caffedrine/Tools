## Monitor network traffic
```$ watch -n 0,5 netstat -A inet -p```

or

```$ sudo iftop -e wlan0```

or

```$ sudo nethogs```

or even

```
$sudo p0f -i wlan0
```

## Monitor disk usage

```$ sudo iotop -aoP```
