{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
#      ./nixos/nextcloud.nix
      ./nixos/neovim.nix
      ./nixos/nvidia.nix
      ./nixos/mlocate.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  systemd.oomd.enableUserSlices = true;
  systemd.extraConfig = "DefaultTimeoutStopSec=30s";
  environment.localBinInPath = true;
  programs.zsh.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.hosts = {
    "192.168.0.238" = [ "rpi" ];
  };

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
    wayland.enable = true;
  };
  services.xserver.desktopManager.gnome.enable = true;
  services.desktopManager.plasma6 = {
    enable = true;
  };
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";

  systemd.timers."restic-backup" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "24h";
      Unit = "restic-backup.service";
    };
  };

  systemd.services."restic-backup" = {
    script = ''
      set -eu
      /home/biscotty/.local/bin/restic-backup.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "biscotty";
    };
  };
 

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "biscotty";
    configDir = "/home/biscotty/.config/syncthing";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brian = {
    isNormalUser = true;
    description = "Brian";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "input"
      "mlocate"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
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
    packages = with pkgs; [
    ];
  };

  users.users.restic = {
    isNormalUser = true;
  };

  security.wrappers.restic = {
    source = "${pkgs.restic.out}/bin/restic";
    owner = "restic";
    group = "users";
    permissions = "u=rwx,g=,o=";
    capabilities = "cap_dac_read_search=+ep";
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
  programs.virt-manager.enable = true;

  virtualisation.containers.enable = true;


  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 2d";
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim-full # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    alacritty
    restic
    qemu
    quickemu
    dive
    cachix
    podman
    podman-tui
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
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; }
    ];
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; }
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
