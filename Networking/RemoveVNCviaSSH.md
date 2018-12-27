## Remote Desktop via SSH and x11 VNC

On host:

```
$ sudo apt-get install x11vnc openssh-server
$ x11vnc -storepasswd
```

On guest:

```
$ ssh ssh_user@ssh_server_hostname -L 5900:localhost:5900 "x11vnc -display :0 -noxdamage -rfbauth ~/.vnc/passwd"
```

Now use any VNC client and connect to localhost:5900