{ config, pkgs, ... }:

# let
#   myAliases = {
# #    lal = "lsd -lah --header";
# #    ls = "lsd --header";
#     lal = "lsd -lah";
#     cd = "z";
#     ze = "zellij e";
#     bt = "bartib";
#     vif = "vim $(fzf)";
#     cat = "bat";
#     rh = "runhaskell";
#     cbc = "xsel --clipboard --input";
#     cbp = "xsel --clipboard --output";
#     zc = "alacritty -e zellij attach Configuration";
#     zb = "zellij a Base2";
#     zo = "zellij a Obsidian";
#     zs = "zellij a Scratch";
#     za = "zellij attach";
#     gac = "git add . && git commit";
#     ip = "ip -c";
#   };
# in
 {
#   programs.zsh = {
#     enable = true;
#     enableCompletion = true;
#     autosuggestions.enable = true;
#     syntaxHighlighting.enable = true;
#     shellAliases = myAliases;
#   };
  
#   environment.sessionVariables = {
#       EDITOR = "vim";
#       NIXPKGS_ALLOW_UNFREE = 1;
#       NIXPKGS_ALLOW_BROKEN = 1;
#       BARTIB_FILE="/home/biscotty/.local/bartib/activities.bartib";
#       PATH="$PATH:/home/biscotty/.cargo/bin";
#       BROWSER = "brave";
#     };

#   programs.starship = {
#     enable = true;
#     #presets = [ "nerd-font-symbols" ];
#   };

  # programs.bash = {
  #   shellAliases = myAliases;
  # };

  environment.systemPackages = with pkgs; [
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    zsh-autopair
    zsh-f-sy-h
    zsh-clipboard
    zsh-completions
  ];  # zsh
}
