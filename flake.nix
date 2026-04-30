{
  description = "Biscotty's Workshop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # sops-nix = {
    #   url = "github:Mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # plasma-manager = {
    #   url = "github:nix-community/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };
    yazi.url = "github:sxyazi/yazi";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.noctalia-qs.follows = "noctalia-qs";
    # };
    # noctalia-qs = {
    #   url = "github:noctalia-dev/noctalia-qs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # niri-session-manager.url = "github:MTeaHead/niri-session-manager";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      # plasma-manager,
      # niri-session-manager,
      ...
    }@inputs:

    let
      #      overlays = [
      #        nvim-ks.overlays.default
      #      ];
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."nixos" = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          # niri-session-manager.nixosModules.niri-session-manager
        ];
        # modules = [ ./configuration.nix sops-nix.nixosModules.sops ];
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
          # inputs.plasma-manager.homeModules.plasma-manager
          ./biscotty/home.nix ];
      };
    };
}
