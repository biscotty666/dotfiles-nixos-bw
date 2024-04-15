{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        RStudio-with-my-packages = pkgs.rstudioWrapper.override{ packages = with pkgs.rPackages; 
        [ 
          ggplot2 
          dplyr 
          xts 
          tidyverse
          sf
          terra
          shiny
          plotly
          tidymodels
          mlr3
        ]; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.bashInteractive ];
          buildInputs = with pkgs; [ 
            R rPackages.pagedown chromium pandoc RStudio-with-my-packages
          ];
        };
      });
}
