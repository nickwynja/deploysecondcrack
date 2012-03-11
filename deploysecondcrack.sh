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
  sudo make install;
  cd ~ ; sudo rm inotify-tools-3.14.tar.gz;

# Install start-stop-daemon for use in /etc/init.d/dropbox

cd ~ ; wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  tar zxvf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/;
  sudo gcc start-stop-daemon.c -o start-stop-daemon;
  cd ~ ; sudo rm apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz

# Install deploysecondcrack

cd ~;
sudo git clone git://github.com/nickwynja/deploysecondcrack.git;

# Install Dropbox
    
cd ~ && wget -O - http://www.dropbox.com/download?plat=lnx.x86_64 | tar xzf -

# Install Dropbox service

cd ~; sudo cp ~/deploysecondcrack/config-files/dropbox-service /etc/init.d/dropbox;
sudo chkconfig --add dropbox;
sudo chkconfig dropbox on;

# Configure Service

sudo cp ~/deploysecondcrack/config-files/sysconfig-dropbox /etc/sysconfig/dropbox;

# Install Dropbox CLI

mkdir -p ~/bin;
wget -O ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py";
sudo chmod 755 ~/bin/dropbox.py;  

# Set up Second Crack `update` cron
  
sudo crontab ~/deploysecondcrack/config-files/crontab.example;

# Config Apache with default settings

sudo cp ~/deploysecondcrack/config-files/httpd.conf /etc/httpd/conf/httpd.conf;
sudo service iptables stop;
sudo rm /etc/httpd/conf.d/welcome.conf;
sudo chmod o+x ~;

# Config PHP settings for short_open_tags

sudo cp ~/deploysecondcrack/config-files/php.ini /etc/php.ini;

# Install Second Crack

cd ~/ ;
sudo git clone git://github.com/marcoarment/secondcrack.git;

# Configure Second Crack

mkdir -p ~/Dropbox/Blog/templates/;
sudo cp ~/secondcrack/example-templates/main.php ~/Dropbox/Blog/templates/main.php;
sudo cp ~/secondcrack/example-templates/rss.php ~/Dropbox/Blog/templates/rss.php;
mkdir -p ~/Dropbox/Blog/drafts/_publish-now/;
sudo cp ~/deploysecondcrack/config-files/hello-world.txt ~/Dropbox/Blog/drafts/_publish-now/;
sudo cp ~/deploysecondcrack/config-files/config.php.example ~/secondcrack/config.php;
sudo vi ~/secondcrack/config.php;