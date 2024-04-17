---
topic:
  - "[[NixOS]]"
related: 
created: 2024-04-16
type:
  - fleeting
action: false
reference: 
modified: 2024-04-17
---
# Contents

## Nixos system install with flakes

1. Install NixOS with defaults, allow unfree software.
2. Add/uncomment vim, git and `nix.settings.experimental-features = [ "nix-command" "flakes" ];` and rebuild with `sudo nixos-rebuild switch`
4. Create the `dotfiles` directory and clone the repository.
5. Copy the configuration.nix to `/etc/nixos` and rebuild
6. Log out and in
7. Switch to `dotfiles`, copy the hardware configuration from `/etc/nixos` and rebuild with `sudo nixos-rebuild switch --flake .`
8. Add home-manager channels with 
```
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
```
9. Log out and in
10. Run `nix-shell '<home-manager>' -A install`
11. Log out and in
12. In `dotfiles` run `home-manager switch --flake .`
13. Log out an in once more

## Set up a dev environment

1. Create a directory for the project
2. Copy the flake.nix, flake.lock and envrc into the directory
3. Edit the flake to add/remove libraries. (Building all the ml and spatial libraries takes a long time.)
4. Run `direnv allow`

# References
