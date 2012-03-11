# Install Apache, PHP, Python, Git, and dependancies

sudo yum install -y httpd php php-process python git gcc automake autoconf libtool make curl-devel libgcc.i686 glibc.i686 php-xml php-mbstring;

# Start Apache on boot and turn off firewall

sudo chkconfig  httpd on;
sudo chkconfig iptables off;

# Install inotify-tools to make updating speedy

wget --no-check-certificate http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-3.14.tar.gz; 
  tar xvfz inotify-tools-3.14.tar.gz;
  cd inotify-tools-3.14;
  ./configure --prefix=/usr --libdir=/lib64;
  sudo make;
  su -c 'make install';
  cd ~ ;
  sudo rm inotify-tools-3.14.tar.gz;

# Install start-stop-daemon for use in /etc/init.d/dropbox

cd ~ ; wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  tar zxvf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/;
  sudo gcc start-stop-daemon.c -o start-stop-daemon;
  cd ~ ; sudo rm apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz

# Install deploysecondcrack

cd ~;
sudo git clone git://github.com/nickwynja/deploysecondcrack.git;

# Set up Second Crack `update` cron  
  
sudo crontab /home/blog/deploysecondcrack/files/crontab.example;
mkdir /home/blog/Dropbox/Blog/templates/;
sudo cp /home/blog/secondcrack/example-templates/main.php /home/blog/Dropbox/Blog/templates/main.php;
sudo cp /home/blog/secondcrack/example-templates/rss.php /home/blog/Dropbox/Blog/templates/rss.php;
sudo cp /home/blog/deploysecondcrack/files/hello-world.txt /home/blog/Dropbox/Blog/drafts/_publish-now/

# Config Apache with default settings

sudo cp /home/blog/deploysecondcrack/files/httpd.conf /etc/httpd/conf/httpd.conf;
sudo service iptables stop;
sudo rm /etc/httpd/conf.d/welcome.conf;
sudo chmod o+x /home/blog/;

# Config PHP settings for short_open_tags

sudo cp /home/blog/deploysecondcrack/files/php.ini /etc/php.ini

# Install Second Crack

cd /home/blog/ ;
sudo git clone git://github.com/marcoarment/secondcrack.git;

# Set config.php

sudo cp /home/blog/deploysecondcrack/files/config.php.example /home/blog/secondcrack/config.php;
sudo vi /home/blog/secondcrack/config.php;
