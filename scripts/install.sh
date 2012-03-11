# Update repos

yum update;

# Install Apache, PHP, Python, Git, and dependancies

yum install httpd php php-process python git gcc automake autoconf libtool make curl-devel libgcc.i686 glibc.i686;

# Start Apache on boot

chkconfig --levels 235 httpd on;

# Install inotify-tools to make updating speedy

wget --no-check-certificate http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-3.14.tar.gz; 
  tar xvfz inotify-tools-3.14.tar.gz;
  cd inotify-tools-3.14;
  ./configure --prefix=/usr --libdir=/lib64;
  make;
  su -c 'make install';
  cd ~ ;
  sudo rm inotify-tools-3.14.tar.gz;

# Install start-stop-daemon for use in /etc/init.d/dropbox

cd ~ ; wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  tar zxvf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/;
  gcc start-stop-daemon.c -o start-stop-daemon;
  cd ~ ; sudo rm apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
  
# Install Dropbox CLI
  
cd ~;
sudo mkdir bin;
cd bin;
wget http://www.dropbox.com/download?dl=packages/dropbox.py;

# Install Dropbox service

cd /home/blog/;
wget http://dl.dropbox.com/u/856720/deploysecondcrack/files/dropbox-service;
sudo cp dropbox-service /etc/init.d/dropbox;
sudo rm dropbox-service
sudo chmod +x /etc/init.d/dropbox;
    
# Install Dropbox
    
cd /home/blog/;
wget -O - http://www.dropbox.com/download?plat=lnx.x86 | tar xzf -;

# Install deploysecondcrack

cd /home/blog/ ;
sudo git clone git://github.com/nickwynja/deploysecondcrack.git;

# Config Apache with default settings

sudo cp /home/blog/secondcrack/files/httpd.conf /etc/httpd/conf/httpd.conf;
sudo service iptables stop;

# Config PHP with default settings

sudo cp /home/blog/secondcrack/files/php.ini /etc/php.ini

# Install Second Crack

cd /home/blog/ ;
sudo git clone git://github.com/marcoarment/secondcrack.git;

# Set up default `update` cron  
  
sudo cp /home/blog/deploysecondcrack/files/example.crontab /etc/crontab;
sudo service httpd restart;

# Set config.php

sudo cp /home/blog/deploysecondcrack/files/config.php.example /home/blog/secondcrack/config.php;
sudo vi /home/blog/secondcrack/config.php:

