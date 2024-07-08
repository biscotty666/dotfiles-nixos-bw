{ config, lib, pkgs, ... }:

{
  systemd.timers."restic-backup" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "24h";
      Unit = "restic-backup.service";
    };
  };

  systemd.services."restic-backup" = {
    script = ''
      set -eu
      /home/biscotty/.local/bin/restic-backup.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "biscotty";
    };
  };
 }

