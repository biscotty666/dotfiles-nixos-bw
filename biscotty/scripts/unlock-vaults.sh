#!/home/biscotty/.nix-profile/bin/bash
if [ -z "$(ls -A $HOME/DropOpen)" ];
    then
        echo "Empty Directory ";
        /run/current-system/sw/bin/gocryptfs $HOME/Dropbox/DropVault $HOME/DropOpen -passfile $HOME/.local/share/gocrypt/secret.txt
    else
        echo "Directory isn’t empty";
fi
if [ -z "$(ls -A $HOME/Documents)" ];
    then
        echo "Empty Directory ";
        /run/current-system/sw/bin/gocryptfs $HOME/DocVault $HOME/Documents -passfile $HOME/.local/share/gocrypt/secret.txt
    else
        echo "Directory isn’t empty";
fi
