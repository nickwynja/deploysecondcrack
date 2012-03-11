**Note:** `deploysecondcrack` is tightly configured for CentOS 6.0. This is intended for easy deployment by users not familiar with environment configuration and system administration. This isn't guaranteed to work at all but is most likely to work with  CentOS 6.0 Rackspace instances. 

After creating a Rackspace account and initiating a CentOS 6.0 server, SSH into the box using the IP address and root password you were emailed. To do this enter `ssh root@YOUR.IP.ADDRESS}`. Type `yes` when prompted to add your RSA and your password. When you see the `[root@servername ~]#` prompt, we're ready to go.

## 1. Create 'blog' user account

**Note:** For ease of setup, we will use the username 'blog'. Changing this to your name will break other deploy scripts.

- Create the new user with the command `useradd -d /home/blog -m blog && sudo passwd blog`. Enter and confirm your password.
- Give 'blog' sudo permissions by entering the command `visudo`. On line 90 (jump to the line by typing `:90`), hit `i` to go into insert mode and add `blog    ALL=(ALL)    ALL`. Exit out of vi by pressing `esc` then type `:wq` and press enter to save and quit.

## 2. Install Environment, Dropbox, Second Crack, and deploysecondcrack

 Paste the following command and press enter to make the magic happen. You'll be prompted for your password.

    cd ~ && wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install.sh; . ~/install.sh
    
This script will install `httpd`, `php`, `git`, `inotify-tools` and update/install other dependancies. It'll take about 5 minutes to run. Dropbox, the Dropbox CLI, a Dropbox `/etc/init.d/` service, Second Crack, and secondcrackdeploy will also be deployed.

After everything is installed, `/secondcrack/config.php` will be displayed where you need to set `$blog_title`, `$blog_url`, and description of your blog. You can also enter a username and password here if you plan on using the bookmarklets.

## 3. Initiate Dropbox

Dropbox is already installed but you need to initiate it and link the server to your account. Enter this command:

    sudo ~/bin/dropbox.py start -i

You will be given a URL you need to copy and paste into your browser to link your account. Make sure you're logged into the account you want to be connected with if you have multiple.