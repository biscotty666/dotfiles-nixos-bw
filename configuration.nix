{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nixos/nvidia.nix
    ./nixos/input.nix
    ./nixos/vm.nix
    ./nixos/mlocate.nix
    ./nixos/programs.nix
    ./nixos/sops.nix
    ./nixos/restic.nix
    ./nixos/cachix.nix
    ./nixos/yazi.nix
    ./brian/modules/utils.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  systemd.oomd.enableUserSlices = true;
  systemd.extraConfig = "DefaultTimeoutStopSec=30s";
  environment.localBinInPath = true;
  programs.zsh.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = [ ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.hosts = { "192.168.0.238" = [ "rpi" ]; };

  networking.networkmanager.enable = true;

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

  services.xserver.enable = true;

  zramSwap.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-chili-theme";
    #theme = "sugar_dark";
    wayland.enable = false;
  };
  # services.xserver.desktopManager.gnome.enable = true;
  #  services.xserver.desktopManager.xfce.enable = true;
  services.desktopManager.plasma6 = { enable = true; };
  #  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "biscotty";
    configDir = "/home/biscotty/.config/syncthing";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #  users.users.brian = {
  #    isNormalUser = true;
  #    description = "Brian";
  #    extraGroups = [
  #      "networkmanager"
  #      "wheel"
  #      "input"
  #      "mlocate"
  #    ];
  #    shell = pkgs.zsh;
  #    packages = with pkgs; [
  #    ];
  #  };

  users.users.biscotty = {
    isNormalUser = true;
    description = "Biscotty";
    extraGroups = [ "networkmanager" "wheel" "input" "mlocate" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  # programs.virt-manager.enable = true;

  virtualisation.containers.enable = true;

  nix.optimise = {
    automatic = true;
    dates = [ "03:54" ];
  };
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 2d";
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".specific
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.flatpak.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    allowedTCPPorts = [ 8384 22000 ];
    allowedUDPPorts = [ 22000 21027 ];
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    }];
    allowedUDPPortRanges = [{
      from = 1714;
      to = 1764;
    }];
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

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    #auto-optimise-store = true;
    trusted-users = [ "root" "biscotty" ];
    trusted-public-keys =
      [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    substituters = [ "https://cache.iog.io" ];
  };
}
