{
  description = "Biscotty's Workshop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
#    snowfall-lib = {
#      url = "github:snowfallorg/lib";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
    nvim-ks = {
      url = "github:biscotty666/nvim-ks";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nvim-ks, nixpkgs, home-manager, sops-nix, yazi, ... } @inputs: 
    
    let
      overlays = [
        nvim-ks.overlays.default
      ];
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations."nixos" = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ 
          ./configuration.nix 
          sops-nix.nixosModules.sops
        ];
      };
    #homeConfigurations."brian" = home-manager.lib.homeManagerConfiguration {
        #inherit pkgs;
        #modules = [ ./home-brian.nix ];
      #};
    #};
    homeConfigurations."biscotty" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./biscotty/home.nix
          #({ pkgs, ... }: {
            #home.packages = [ yazi.packages.${pkgs.system}.default ];
          #})
        ];
      };
    };
}
