{ config, pkgs, ... }:

let
  myAliases = {
    ll = "lsd -l --header";
    ls = "lsd";
    lal = "lsd -la --header";
    cd = "z";
    bt = "bartib";
    vif = "vim $(fzf)";
    cat = "bat";
    rh = "runhaskell";
    cbc = "xsel --clipboard --input";
    cbp = "xsel --clipboard --output";
    gac = "git add . && git commit";
    ip = "ip -c";
    vi = "nvim";
    nhc = "sudo nh clean all -v --nogcroots --keep 2 --keep-since 5d";
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
      EDITOR = "nvim";
      NIXPKGS_ALLOW_UNFREE = 1;
      NIXPKGS_ALLOW_BROKEN = 1;
      BARTIB_FILE="/home/biscotty/.local/bartib/activities.bartib";
      PATH="$PATH:/home/biscotty/.cargo/bin";
      BROWSER = "brave";
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

  programs.starship = {
    enable = true;
    #presets = [ "nerd-font-symbols" ];
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
