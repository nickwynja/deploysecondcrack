**Note:** `deploysecondcrack` is tightly configured for CentOS 6.0 on Rackspace Cloud. This is intended for easy deployment by users not familiar with environment configuration and system administration. This isn't guaranteed to work at all but is most likely to work with Rackspace's CentOS 6.0 instances. 

## 1. Create 'blog' user account

**Note:** For ease of setup, we will use the username 'blog'. Changing this to your name will break other deploy scripts.

Create the new user with the command `useradd -d /home/blog -m blog && sudo passwd blog`. 

## 1. Install Environment, Dropbox, Second Crack and `deploysecondcrack`

After creating a Rackspace account and creating a CentOS 6.0 server, SSH into the box using the IP address and root password you were emailed. To do this enter `ssh root@{YOURIPADDRESS}`. Type `yes` when prompted to add your RSA and your password. When you see the `[root@servername ~]#` prompt paste in the following command and press enter:

    wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install.sh; . ./install.sh
    
This script will install `httpd`, `php`, `git`, `inotify-tools` and update/install other dependancies. It'll take a little while to run, maybe 10 minutes, but don't walk away—you'll have to enter `y` a few times when prompted. Dropbox, the Dropbox CLI, a Dropbox `/etc/init.d/` service, Second Crack, and `secondcrackdeploy` will also be deployed.

After everything is installed, `/secondcrack/config.php` will be displayed where you need to set `$blog_title`, `$blog_url`, and description of your blog. Press `i` to go into insert mode to edit your configuration. You can also enter a username and password here is you plan on using the bookmarklets. Exit out of vi by pressing `esc` then type `:wq` and press enter to save and quit.

# Start Dropbox

After installation, enter the command `/etc/init.d/dropbox start` to start Dropbox. You will be shown a URL you need to copy and paste into your browser to link the server to your account. Make sure you're logged into the account you want to be connected with if you have multiple. Once you link your account, you should see the `Client successfully linked` message. To get back to the command prompt hit ctrl+c. You'll see the message `Session terminated, killing shell... ...killed.` but that's OK, Dropbox should still be running and syncing fine.
