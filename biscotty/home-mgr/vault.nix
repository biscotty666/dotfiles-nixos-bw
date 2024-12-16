{ pkgs, ... }:


{
  systemd.user.services.unlock-vaults = {
    Unit = {
      Description = "Unlock encrypted vaults";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "unlock-vaults" ''
        #!/run/current-system/sw/bin/bash
        if [ -z "$(ls -A /home/biscotty/DropOpen)" ];
        then
            echo "Empty Directory ";
            /home/biscotty/.nix-profile/bin/gocryptfs /home/biscotty/Dropbox/DropVault /home/biscotty/DropOpen -passfile /home/biscotty/.local/share/gocrypt/secret.txt
        else
            echo "Directory isn’t empty";
        fi
        if [ -z "$(ls -A /home/biscotty/Documents)" ];
        then
            echo "Empty Directory ";
            /home/biscotty/.nix-profile/bin/gocryptfs /home/biscotty/DocVault /home/biscotty/Documents -passfile /home/biscotty/.local/share/gocrypt/secret.txt
        else
            echo "Directory isn’t empty";
        fi
              ''}";
    };
  };
}
