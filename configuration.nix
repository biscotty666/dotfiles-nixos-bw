{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./nixos/nvidia.nix
    ./nixos/flatpak.nix
    #    ./nixos/input.nix
    ./nixos/vm.nix
    ./nixos/fonts.nix
    ./nixos/utilities.nix
    ./nixos/steam.nix
    ./nixos/langs.nix
    #./nixos/sops.nix
    ./nixos/restic.nix
    ./nixos/neovim.nix
    ./nixos/kde.nix
    ./nixos/nushell.nix
    ./nixos/syncthing.nix
    ./nixos/cachix.nix
    ./nixos/dm.nix
    ./nixos/yazi.nix
    ./nixos/spell.nix
    ./nixos/lsp.nix
    ./nixos/gui.nix
    # ./nixos/osrm.nix
    ./nixos/options.nix
    ./nixos/zsh.nix
    ./nixos/bootloader.nix
    ./brian/modules/utils.nix
    ./containers/database.nix
    # ./nixos/zen.nix
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
    desktopManager.plasma6 = {
      enable = true;
    };
    xserver.desktopManager.xfce.enable = true;
    desktopManager.gnome.enable = true;
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
    shell = pkgs.zsh;
    # packages = with pkgs; [ ];
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

  # Open ports in the firewall.
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

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    #auto-optimise-store = true;
    trusted-users = [
      "root"
      "biscotty"
    ];
    trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    substituters = [ "https://cache.iog.io" ];
    download-buffer-size = 524288000;
  };
}
