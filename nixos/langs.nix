{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    python3
    gcc
  ];

}
