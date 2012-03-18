# Remove current install

cd ~ && rm -rf .dropbox* Dropbox;
cd ~ && wget -O - http://www.dropbox.com/download?plat=lnx.x86_64 | tar xzf - ;
sudo chown -R $USER ~/Dropbox/;
sudo chmod -R u+rw ~/Dropbox;
sudo chown -R $USER ~/.dropbox;
sudo chmod -R u+rw ~/.dropbox;
