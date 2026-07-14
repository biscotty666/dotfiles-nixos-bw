{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    python3
    gcc
    ghc
    haskell-language-server
    statix
  ];

}
