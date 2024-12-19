{ pkgs, ...}: {
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
            lazygit
    ];
  };

}
