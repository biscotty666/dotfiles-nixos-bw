{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    markdown-oxide
    ruff
    rPackages.lintr
    rPackages.languageserver
 ];

}
