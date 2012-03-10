**Note:** `deploysecondcrack` is tightly configured for CentOS 6.0 on Rackspace Cloud. This is intended for easy deployment by users not familiar with environment configuration and system administration. This isn't guaranteed to work at all but is most likely to work with Rackspace's CentOS 6.0 instances. 

## 1. Install Environment

After creating a Rackspace account and creating a CentOS 6.0 server, SSH into the box using the IP address and root password you were emailed. To do this enter `ssh root@{YOURIPADDRESS}`. Type `yes` when prompted to add your RSA and your password. When you see the `[root@servername ~]#` prompt paste in the following command and press enter:

    wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install-env.sh; . ./install-env.sh
    
This script will install `httpd`, `php`, `git`, `inotify-tools` and update/install other dependancies. It'll take a little while to run, maybe 10 minutes, but don't walk away—you'll have to enter `y` a few times when prompted.

## 3. Create 'blog' user account, give it proper permissions

**Note:** For ease of setup, we will use the username 'blog'. Changing this to your name will break other deploy scripts.

Create the new user with the command `useradd -d /home/blog -m blog && sudo passwd blog`. Enter the command `visudo` and on line 96 (jump there by typing `:96` in vi) add `blog    ALL=(ALL)       ALL` to give blog `sudo` permission. Once this is done, exit out of the vi text editor by first pressing `esc` then type `:wq` and press enter to save and quit.

## 2. Install Dropbox

Entering the following command will install Dropbox, the Dropbox CLI, and a service that will give you control of Dropbox using `/etc/init.d/dropbox'.

    cd ~ ; wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install-dropbox.sh;   . ./install-dropbox.sh
    
After installation, you will be shown a URL you need to copy and paste into your browser to link the server to your account. Make sure you're logged into the account you want to be connected with if you have multiple.

Once you link your account, you should see the `Client successfully linked` message. To get back to the command prompt hit ctrl+c.

## 4. Install Second Crack and DeploySecondCrack

    wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install-secondcrack.sh; . ./install-secondcrack.sh

