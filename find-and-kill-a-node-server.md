## If you get the message that the server is already running on the port
- At a terminal window find the node process runnng on the port
```
sudo lsof -i :5000
COMMAND   PID  USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
node    12285 craig   20u  IPv6 11035840      0t0  TCP *:5000 (LISTEN)
```
- then kill the process
```
kill -9 12285
```
---
