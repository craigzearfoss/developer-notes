## Chrome
- https://www.linuxbabe.com/ubuntu/install-google-chrome-ubuntu-18-04-lts	
- Add Xdebug helper
  - https://chrome.google.com/webstore/search/xdebug?hl=en-US
---
## Guake
- [Install and Use Guake – A drop-down Terminal Emulator for Ubuntu](https://vitux.com/install-and-use-guake-a-drop-down-terminal-emulator-for-ubuntu/)
```
sudo apt-get update
sudo apt-get install guake
guake --version
guake --help
man guake
guake -p
guake
```
---
## wget
```
sudo apt-get update
sudo apt-get install wget
```
---
## Dropbox
- Installing Dropbox from Command Line
    - [How to Install Dropbox on Ubuntu 18.04 (Terminal/GUI)](https://linoxide.com/linux-how-to/install-dropbox-ubuntu/)
```
sudo apt-get update
sudo apt-get install wget
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
```
- Installing Dropbox CLI
```
sudo apt install python
sudo wget -O /usr/local/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"
sudo chmod +x /usr/local/bin/dropbox
dropbox
dropbox help running
dropbox status
dropbox start
dropbox status
dropbox stop
```
- Starting Dropbox Automatically Every Reboot
```
sudo nano /etc/systemd/system/dropbox.service
sudo systemctl daemon-reload
sudo systemctl enable dropbox
sudo systemctl start dropbox
sudo systemctl status dropbox
```
---
## Lastpass
- [LastPass](https://www.lastpass.com/)
---
## Nginx
- [How To Install Nginx on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04)
```
sudo apt update
sudo apt install nginx
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
systemctl status nginx
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```
---
## PHP7.3
- [How to install PHP 7.3 on Ubuntu 18.04](https://www.cloudbooklet.com/how-to-install-php-7-3-on-ubuntu-18-04/)
```
sudo apt update
sudo apt upgrade
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt install php7.3-fpm
sudo apt-cache policy php7.3
php-fpm7.3 -v
sudo apt install php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl php-xml sudo apt-get install php7.4-zip php-xdebug -y
apt-cache search php7.3-*
sudo nano /etc/php/7.3/fpm/pool.d/www.conf
sudo nano /etc/php/7.3/fpm/php.ini
sudo php-fpm7.3 -t
sudo service php7.3-fpm restart
```
---
## Xdebug
- [Configure Xdebug + PHP 7 + Nginx + Any Linux Distribution](https://dev.to/thamaraiselvam/configure-xdebug-php-7-nginx-any-linux-distribution-3ic0)
```
sudo nano /etc/php/7.4/mods-available/xdebug.ini
```
- Add the following
```
xdebug.remote_autostart = 1
xdebug.remote_enable = 1
xdebug.remote_handler = dbgp
xdebug.remote_host = 127.0.0.1
xdebug.remote_log = /tmp/xdebug_remote.log
xdebug.remote_mode = req
xdebug.remote_port = 9000 #this can be modified
xdebug.scream = 0
xdebug.cli_color = 1
xdebug.show_local_vars = 1
```
- sudo nano /etc/php/7.4/cli/php.ini
```
extension=xdebug
```
- Restart the server
```
sudo systemctl restart php7.3-fpm
sudo systemctl restart nginx
```
- In PhpStorm
```
=> Settings/Preferences => PHP => Languages & Frameworks
    - set the CLI (you can find it by looking for the php.ini
    - path you you enter php -i from the command line.)
```
---
## Git
- [How To Install Git on Ubuntu 18.04 [Quickstart]](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04-quickstart)
```
sudo apt update
sudo apt install git
git --version
git config --global user.name "Craig Zearfoss"
git config --global user.email "craigzearfoss@yahoo.com"
nano ~/.gitconfig
```
---
## MySQL
- [How To Install MySQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)
```
sudo apt update
sudo apt-get install mysql-server

sudo mysql_secure_installation
sudo systemctl status mysql
sudo systemctl enable mysql
sudo apt-get update
?	sudo apt-get install mysql-workbench-community libmysqlclient18
sudo mysql -u root -p
create database pooch_vip;
```
- Create users	
- [How To Create a New User and Grant Permissions in MySQL](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql)
```
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'webmanager'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON pooch_vip . *  TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON pooch_vip . *  TO 'webmanager'@'localhost';
FLUSH PRIVILEGES;
```
- If using MySQL 8you get the message SQLSTATE[HY000] [2054] The server requested authentication method unknown to the client then you will have to do the following because MySQL 8 changed the encryption and PHP/Laravel isn't yet ready for it.
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'pooch-admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pooch-admin';
ALTER USER 'pooch-site'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pooch-site';
```
- To remove and reinstall MySQL
- [How To Completely Remove MySQL From Ubuntu](https://mysql.tutorials24x7.com/blog/how-to-completely-remove-mysql-from-ubuntu)
  - Backup data
```
sudo rsync -av <mysql data> <backup location>
```
  - Complete backup
```
tar -zcvf <destination file> /etc/mysql /var/lib/mysql
sudo systemctl status mysql.service
sudo systemctl stop mysql
sudo systemctl kill mysql	
sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-5.7 mysql-client-core-5.7
sudo rm -rfv /etc/mysql /var/lib/mysql
sudo apt-get remove dbconfig-mysql
sudo apt autoclean
sudo apt autoremove
```
- Reinstall
```
sudo apt-get update    
sudo apt-get install mysql-server mysql-client --fix-broken --fix-missing
```
---	
## Composer
- [How To Install and Use Composer on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-18-04)
```
sudo apt update
sudo apt install curl php-cli php-mbstring git unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
```
- Installer verified
```
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo chown -R $USER ~/.composer/
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc
```
---
## Laravel
- [https://laravel.com/docs/6.x/installation](https://laravel.com/docs/6.x/installation)
```
composer global require laravel/installer
```
- Authentication stuff
```
composer require laravel/ui --dev
php artisan ui view
php artisan ui vue --auth
npm install && npm run dev
```
---
## Generate ssh key
- [How to Set Up SSH Keys on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-1804)
```
ssh-keygen -o
```
- Copy ~/ssh/id_rsa.pub to Github repos
---
## PhpStorm
- [How to Install PhpStorm on Ubuntu 18.04](https://linux4one.com/how-to-install-phpstorm-on-ubuntu-18-04/)
```
sudo apt install snapd snapd-xdg-open
sudo snap install phpstorm --classic
```
---
## htop
```
sudo apt install htop
```
---
## Notepad++
- [Notepad++ Linux- Install Notepad++ on Linux Ubuntu 18.04/16.04, 19.04 & More](https://www.tecrobust.com/install-notepad-plus-plus-linux-ubuntu/)
```
sudo apt-get install snapd
sudo apt-get install wine-stable
sudo snap install notepad-plus-plus
```
---
## Beyond Compare
- [Beyond Compare Linux Installation Instructions](https://www.scootersoftware.com/download.php?zz=kb_linux_install)
```
wget https://www.scootersoftware.com/bcompare-4.3.4.24657_amd64.deb
sudo apt-get update
sudo apt-get install gdebi-core
sudo gdebi bcompare-4.3.4.24657_amd64.deb
```
---
## Setting up MySQL for PHP
```
composer update
composer require doctrine/dbal
sudo apt-get install php7.4-mysql
```
---
## Node.js
```
sudo apt update
sudo apt install nodejs
sudo apt install npm
nodejs -v
sudo apt install build-essential
npm install latest-version
hash -d npm
```
```
npm run
npm run watch
```
- if permission errors
```
sudo chown -R $(whoami) ~/.npm
```
---
## Slack
- [How to Install Slack on Ubuntu 18.04](https://linuxize.com/post/how-to-install-slack-on-ubuntu-18-04/)
```
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb
slack
```
---
## Visual Studio Code
- [How to Install Visual Studio Code on Ubuntu 18.04](https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/)
- [Visual Studo Code Docs](https://code.visualstudio.com/docs/?dv=linux64_deb)
```
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```
- Start by running from the command line:
```
code
```
- Install the following extensions:
    - JavaScript
    - Python
    - PHP
    - ESLint
    - Prettier - Code formatter
    - Debugger for Crhome
    - vscode-icons
---
## Postgres
- [How To Install and Use PostgreSQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
```
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo -i -u postgres
```
---
## Postman
- [How to Install Postman on Ubuntu 18.04](https://linuxize.com/post/how-to-install-postman-on-ubuntu-18-04/)
```
sudo snap install postman
```
---