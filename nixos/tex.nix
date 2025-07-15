{ pkgs, ... }:

{

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    texlive.combine {
  inherit (texlive) scheme-medium titlesec paralist framed;
}
  ];

}
