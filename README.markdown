## Install Environment

    wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install-env.sh; . ./install-env.sh

## Switch to 'blog' account

    useradd -d /home/blog -m blog && sudo passwd blog
    visudo
    su blog
    
## Install Dropbox

    wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install-dropbox.sh; sudo . ./install-dropbox.sh
    
## Install Second Crack and DeploySecondCrack

  wget http://dl.dropbox.com/u/856720/deploysecondcrack/scripts/install-secondcrack.sh; sudo . ./install-secondcrack.sh

