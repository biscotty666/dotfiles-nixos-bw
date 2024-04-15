{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    la = "ls -a";
    lal = "ls -lah";
  };
in
{
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
