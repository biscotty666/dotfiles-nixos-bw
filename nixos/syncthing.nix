{ config, lib, ... }:

  let
    theUser = "biscotty";
  in 
{
  services.syncthing = {
    enable = true;
    user = theUser;
    configDir = "${config.users.users.${theUser}.home}/.config/syncthing";
  };
}
