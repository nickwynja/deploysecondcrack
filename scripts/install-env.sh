# Update repos

yum update;

# Install Apache, PHP, Python, Git, and dependancies

yum install httpd php php-process python git gcc automake autoconf libtool make curl-devel libgcc.i686 glibc.i686;

# Fire up Apache on boot

chkconfig --levels 235 httpd on;

# Install inotify-tools to make updating speedy

wget --no-check-certificate http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-3.14.tar.gz; 
  tar xvfz inotify-tools-3.14.tar.gz;
  cd inotify-tools-3.14;
  ./configure --prefix=/usr --libdir=/lib64;
  make;
  su -c 'make install';

# Install start-stop-daemon for use in /etc/init.d/dropbox

wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  tar zxvf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz;
  cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/;
  gcc start-stop-daemon.c -o start-stop-daemon