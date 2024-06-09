{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    zsh-autopair
    zsh-f-sy-h
    zsh-clipboard
    zsh-completions
  ];  # zsh
 }
