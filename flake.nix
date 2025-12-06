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
#    nixvim = {
 #       url = "github:nix-community/nixvim";
  #      inputs.nixpkgs.follows = "nixpkgs";
   # };
   zen-browser.url = "github:MarceColl/zen-browser-flake";
  };


  outputs = { self, nixpkgs, home-manager, sops-nix, ... } @inputs:

    let
#      overlays = [
#        nvim-ks.overlays.default
#      ];
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
          ./biscotty/home-mgr/home.nix
        ];
      };
    };
}
