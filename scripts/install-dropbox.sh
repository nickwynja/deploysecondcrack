# Install Dropbox
    
cd ~; sudo wget http://www.dropbox.com/download?plat=lnx.x86 | tar xzf -;

# Install Dropbox service

cd ~; wget http://dl.dropbox.com/u/856720/deploysecondcrack/files/dropbox-service;
sudo cp dropbox-service /etc/init.d/dropbox;
sudo rm dropbox-service;
sudo chkconfig --add dropbox;
sudo chkconfig dropbox on;

# Configure Service

# cd ~; wget http://dl.dropbox.com/u/856720/deploysecondcrack/files/dropbox-service /etc/sysconfig/dropbox;

# Install Dropbox CLI

mkdir -p ~/bin;
wget -O ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py";
sudo chmod 755 ~/bin/dropbox.py;  
~/bin/dropbox.py start -i -y;
~/bin/dropbox.py start;

# mkdir /home/blog/Dropbox/Blog/templates/;
# sudo cp /home/blog/secondcrack/example-templates/main.php /home/blog/Dropbox/Blog/templates/main.php;
# sudo cp /home/blog/secondcrack/example-templates/rss.php /home/blog/Dropbox/Blog/templates/rss.php;
# sudo cp /home/blog/deploysecondcrack/files/hello-world.txt /home/blog/Dropbox/Blog/drafts/_publish-now/