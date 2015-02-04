#!/bin/bash

# General variables
GIT_USER='JPry'
GIT_REMOTE='jpry'
WPE_DIR='/wpengine'
CWD="$(pwd)"
GROUP="$(id -g -n $USER)"

# Set up WPE Git repos
sudo mkdir $WPE_DIR
sudo chown $USER:$GROUP $WPE_DIR
cd $WPE_DIR
for repo in {badboyz,config-tool,masterchief,nas2,nova,ops-dashboard,plugin-wpengine-ready,qawp,server-cm,shared,snappyshot,soapbox,webconsole}; do
    if [[ ! -d $repo ]]; then
        git clone https://github.com/wpengine/$repo.git && cd $repo
        git remote add $GIT_REMOTE https://github.com/$GIT_USER/$repo.git
        cd ..
    fi
done
unset repo
cd $CWD
