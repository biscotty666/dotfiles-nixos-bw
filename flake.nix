{
  description = "Biscotty's Workshop";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    # zen-browser = {
    #   url = "github:youwen5/zen-browser-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   # inputs.noctalia-qs.follows = "noctalia-qs";
    # };
    # noctalia-qs = {
    #   url = "github:noctalia-dev/noctalia-qs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # niri-session-manager.url = "github:MTeaHead/niri-session-manager";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      # sops-nix,
      # plasma-manager,
      # niri-session-manager,
      nix-index-database,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = self.nixosConfigurations.nixos.config.system.build.toplevel;
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          nix-index-database.nixosModules.default
          # sops-nix.nixosModules.sops
          # niri-session-manager.nixosModules.niri-session-manager
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
          # inputs.plasma-manager.homeModules.plasma-manager
          ./biscotty/home.nix
        ];
      };
    };
}
