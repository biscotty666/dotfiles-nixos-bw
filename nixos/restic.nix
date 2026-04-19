{
  config,
  lib,
  pkgs,
  ...
}:

let
  theUser = "biscotty";
in
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
      ${config.users.users.${theUser}.home}/.local/bin/restic-backup.sh
      # /home/biscotty/.local/bin/restic-backup.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = theUser;
    };
  };

  users.users.restic = {
    isNormalUser = true;
  };

  security.wrappers.restic = {
    source = "${pkgs.restic.out}/bin/restic";
    owner = "restic";
    group = "users";
    permissions = "u=rwx,g=,o=";
    capabilities = "cap_dac_read_search=+ep";
  };

}
