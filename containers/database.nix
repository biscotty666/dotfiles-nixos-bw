{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ postgresql ];
  containers.database = {
    config = { config, pkgs, ... }: {
      services.postgresql.enable = true;
      services.postgresql.package = pkgs.postgresql_14;
      system.stateVersion = "25.11";
    };
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    autoStart = true;

  };
  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "eth0";
  };
}
