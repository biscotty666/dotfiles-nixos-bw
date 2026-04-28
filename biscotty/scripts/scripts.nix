{ 
home.file = {
    ".local/bin/unlock-vaults.sh" = {
      source = ./unlock-vaults.sh;
      executable = true;
    };
    ".local/bin/restic-backup.sh" = {
      source = ./restic-backup.sh;
      executable = true;
    };
    ".local/bin/fix-enet.sh" = {
      source = ./fix-enet.sh;
      executable = true;
    };
  };
}
