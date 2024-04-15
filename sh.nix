{ config, pkgs, ... }:

let
  myAliases = {
    # ll = "ls -l";
    # la = "ls -a";
    lal = "ls -lah";
    cd = "z";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
