{
  description = "Biscotty's Workshop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  #hyprland.url = "github:hyprwm/Hyprland";
  hyprland-plugins = {
    url = "github:hyprwm/hyprland-plugins";
    inputs.hyprland.follows = "hyprland";
  };
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:jakehamilton/neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: 
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations."nixos" = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ ./configuration.nix ];
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
        #hyprland.homeManagerModules.default ## already commented
        #{wayland.windowManager.hyprland.enable = true;} ## already commented
        ];
      };
    };
}
