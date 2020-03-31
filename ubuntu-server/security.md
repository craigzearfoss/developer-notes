## Password protect a directory  
- luxurypooch is the user name
- [Password protecting directories with Nginx](https://help.dreamhost.com/hc/en-us/articles/215837528-Password-protecting-directories-with-Nginx)
```
sudo apt install apache2-utils
sudo nano /var/www/local.pooch.vip/basic_auth.conf
htpasswd -c /var/www/local.pooch.vip/.htpasswd luxurypooch
sudo systemctl restart nginx
```
---
