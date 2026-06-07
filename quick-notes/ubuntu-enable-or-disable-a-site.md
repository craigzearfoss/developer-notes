### Enable a site
```
sudo ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf
sudo systemctl reload nginx
```

### Disable a site
```
ls /etc/nginx/sites-available
sudo rm /etc/nginx/sites-enabled/example.com.conf
sudo systemctl reload nginx
```

References:
- [Sites Enabled with NGINX or Apache](https://www.linode.com/docs/guides/how-to-enable-disable-website/)