{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    typst
    typstyle
    typstfmt
    typst-live
    typstwriter
  ];

}
