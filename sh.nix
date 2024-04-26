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
    sessionVariables = {
      EDITOR = "vim";
      NIXPKGS_ALLOW_UNFREE = 1;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          sha256 = "1b4pksrc573aklk71dn2zikiymsvq19bgvamrdffpf7azpq6kxl2";
        };
      }
    ];
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
