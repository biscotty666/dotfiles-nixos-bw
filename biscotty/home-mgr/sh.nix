{ config, pkgs, ... }:

let
  myAliases = {
#    lal = "lsd -lah --header";
#    ls = "lsd --header";
    lal = "lsd -lah";
    cd = "z";
    ze = "zellij e";
    bt = "bartib";
    vif = "vim $(fzf)";
    cat = "bat";
    rh = "runhaskell";
    cbc = "xsel --clipboard --input";
    cbp = "xsel --clipboard --output";
    zc = "alacritty -e zellij attach Configuration";
    zb = "zellij a Base2";
    zo = "zellij a Obsidian";
    zs = "zellij a Scratch";
    za = "zellij attach";
    gac = "git add . && git commit";
    ip = "ip -c";
    tf = "fuck";
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
      NIXPKGS_ALLOW_BROKEN = 1;
      BARTIB_FILE="/home/biscotty/.local/bartib/activities.bartib";
      PATH="$PATH:/home/biscotty/.cargo/bin";
      BROWSER = "w3m";
    };
    #oh-my-zsh = {
      #enable = true;
      #plugins = [
        #"git"
        ## "sudo"
        #"thefuck"
        #"web-search"
        #"catimg"
        #"colored-man-pages"
        #"colorize"
      #];
      #theme = "gnzh";
      #theme = "arrow";
    #};
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

  programs.starship = {
    enable = true;
    #presets = [ "nerd-font-symbols" ];
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
