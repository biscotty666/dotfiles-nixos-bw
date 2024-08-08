{ config, pkgs, ... }:

{
    services.emacs.enable = true;

    programs.emacs = {
        enable = true;
        package = pkgs.emacs-gtk;
        extraPackages = epkgs: [ epkgs.dracula-theme ];
        extraConfig = ''
            (setq standard-indent 2)
    '';
    };
}
