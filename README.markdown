**Note:** `deploysecondcrack` is tightly configured for CentOS 6.0. This is intended for easy deployment by users not familiar with environment configuration and system administration. This isn't guaranteed to work at all but is most likely to work with  CentOS 6.0 Rackspace instances. 

**If you're new to this:** Read my post at [nickwynja.com/deploysecondcrack](http://nickwynja.com/deploysecondcrack) that goes into more detail about how you can get Second Crack up and running.

### 1. Create 'blog' user account

**Note:** For ease of setup, we will use the username 'blog'. Changing this to your name will break other deploy scripts.

- Create the new user with the command `useradd -d /home/blog -m blog && sudo passwd blog`. Enter and confirm your password.
- Give 'blog' sudo permissions by entering the command `visudo`. On line 90 (jump to the line by typing `:90`), hit `i` to go into insert mode and add `blog    ALL=(ALL)    ALL`. Exit out of vi by pressing `esc` then type `:wq` and press enter to save and quit. 

Next switch to your new 'blog' user account with the command `su blog`.

### 2. Install Environment, Dropbox, Second Crack, and deploysecondcrack

 Paste the following command and press enter to make the magic happen. You'll be prompted for your password.

    cd ~ && wget https://raw.github.com/nickwynja/deploysecondcrack/master/deploysecondcrack.sh; . ~/deploysecondcrack.sh
    
This script will install `httpd`, `php`, `git`, `inotify-tools` and update/install other dependancies. It'll take about 5 minutes to run. Dropbox, the Dropbox CLI, a Dropbox `/etc/init.d/` service, Second Crack be deployed.

After everything is installed, `~/secondcrack/config.php` will be displayed where you need to set `$blog_title`, `$blog_url`, and the description of your blog. You can also enter a username and password here if you plan on using the bookmarklets.

Optional: If you want some basic styling out of the box, you'll have to include the stylesheet that was placed in `~/Dropbox/Blog/assets/main.css` into the `main.php` template file in `~/Dropbox/templates/`. To open it up in Vim use the command `sudo vi ~/Dropbox/Blog/templates/main.php` and add in the following code on line 8 (or anywhere in `<head>`:

    <link href="http://YOURDOMAIN.com/assets/css/main.css" rel="stylesheet">
    
We use a hardcoded URL here rather than a relative path so that our stylesheet can be found when you preview posts locally out of the `_previews` folder. 

### 3. Initiate Dropbox


Dropbox mostly installed but you need to initiate it and link the server to your account. Enter this command:

    ~/.dropbox-dist/dropboxd

You will be given a URL you need to copy and paste into your browser to link your account. Make sure you're logged into the account you want to be connected with if you have multiple. You'll have to quit out of this process with ctrl-c once you've connected your account.
    
    sudo service dropbox start

This will start up the Dropbox daemon that runs in the background.


### 4. Start Apache

Fire up Apache and you're done! 

    sudo service httpd start

    
## Notes:

- See Marco's documentation on [Second Crack](https://github.com/marcoarment/secondcrack) for the basics of how to create new posts.
- If previews of drafts aren't being creating in `/drafts/_previews/` make sure you are using the correct extension that's listed as `$post_extension` in `config.php`.
- If you are having trouble with posts not being created then run `dropbox status` to check if there is a problem syncing. If you get a message like `Can't sync "draft-test.md": permission denied` then check `ls -l /home/blog/Dropbox/Blog/`. All of the folders should belong to blog, not root. To fix this enter `sudo chown -R blog:blog /home/blog/Dropbox/Blog/`.
- This configuration does not include much security. In fact, it completely disables the firewall. Maybe sometime in the future I'll add [APF](http://www.rfxn.com/projects/advanced-policy-firewall/) but for now, you're on your own.
- I'm not a total neckbeard sysadmin. My implementation of the server environment is likely poor. Use it at your own risk (or fix my code if you know better).
- Neither myself or Marco are responsible for anything that goes wrong. I'll try and help if I can but don't email him.
