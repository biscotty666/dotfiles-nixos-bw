{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    #    ./nixos/input.nix
    # ./nixos/niri.nix
    # ./nixos/nushell.nix
    # ./nixos/osrm.nix
    # ./nixos/zen.nix
    #./nixos/sops.nix
    ./brian/modules/utils.nix
    ./containers/database.nix
    ./nixos/bootloader.nix
    ./nixos/cachix.nix
    ./nixos/dm.nix
    ./nixos/flatpak.nix
    ./nixos/fonts.nix
    ./nixos/gnome.nix
    ./nixos/gui.nix
    ./nixos/kde.nix
    ./nixos/kindle.nix
    ./nixos/langs.nix
    ./nixos/lsp.nix
    ./nixos/neovim.nix
    ./nixos/nvidia.nix
    ./nixos/obs-studio.nix
    ./nixos/options.nix
    ./nixos/restic.nix
    ./nixos/spell.nix
    ./nixos/steam.nix
    ./nixos/syncthing.nix
    ./nixos/typst.nix
    ./nixos/utilities.nix
    ./nixos/vm.nix
    ./nixos/yazi.nix
    ./nixos/zsh.nix
  ];

  boot.enableContainers = true;
  systemd.oomd.enableUserSlices = true;
  environment.localBinInPath = true;
  programs = {
    zsh.enable = true;
    nix-ld = {
      enable = true;
      libraries = [ ];
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  documentation.dev.enable = true;

  networking = {
    hostName = "nixos"; # Define your hostname.
    hosts = {
      "192.168.4.30" = [ "rpi" ];
    };

    networkmanager = {
      enable = true;
      plugins = with pkgs; [ networkmanager-openvpn ];
    };
  };

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  zramSwap.enable = true;

  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    # xserver.desktopManager.xfce.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing = {
      enable = true;
      drivers = [ pkgs.brlaser ];
    };
    openssh.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  users.users.biscotty = {
    isNormalUser = true;
    description = "Biscotty";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "mlocate"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    permittedInsecurePackages = [ "googleearth-pro-7.3.6.10201" ];
  };
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    containers.enable = true;
  };

  nix = {
    optimise = {
      automatic = true;
      dates = [ "03:54" ];
    };
    gc = {
      automatic = false;
      dates = "daily";
      options = "--delete-older-than 2d";
    };
  };

  networking.firewall = {
    allowedTCPPorts = [
      8384
      22000
    ];
    allowedUDPPorts = [
      22000
      21027
    ];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    trusted-users = [
      "root"
      "biscotty"
    ];
    trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    substituters = [
      "https://cache.iog.io"
      "https://nixos-cache-proxy.cofob.dev"
    ];
    download-buffer-size = 524288000;
  };
}
