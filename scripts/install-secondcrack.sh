cd /var/www/ ;
sudo git clone git://github.com/marcoarment/secondcrack.git;
cd /home/blog/ ;
sudo git clone git://github.com/nickwynja/deploysecondcrack.git;
  
sudo cp /home/blog/deploysecondcrack/files/example.crontab /etc/crontab;

sudo cp /home/blog/deploysecondcrack/files/config.php.example /var/www/secondcrack/config.php;
sudo vi /var/www/secondcrack/config.php