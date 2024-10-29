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
        /home/biscotty/.nix-profile/bin/gocryptfs /home/biscotty/Dropbox/DropVault /home/biscotty/DropOpen -passfile /home/biscotty/.local/share/gocrypt/secret.txt
        /home/biscotty/.nix-profile/bin/gocryptfs /home/biscotty/DocVault /home/biscotty/Documents -passfile /home/biscotty/.local/share/gocrypt/secret.txt
              ''}";
    };
  };
}
