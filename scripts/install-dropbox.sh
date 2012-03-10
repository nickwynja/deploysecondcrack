cd ~;
sudo mkdir bin;
cd bin;
wget http://www.dropbox.com/download?dl=packages/dropbox.py;

cd /home/blog/;
wget http://dl.dropbox.com/u/856720/deploysecondcrack/files/dropbox-service;
sudo cp dropbox-service /etc/init.d/dropbox;
sudo chmod +x /etc/init.d/dropbox;
    
cd /home/blog/;
wget -O - http://www.dropbox.com/download?plat=lnx.x86 | tar xzf -;