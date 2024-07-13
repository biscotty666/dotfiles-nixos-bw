{ inputs, config, ... }:
{
  imports = [
    #inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    
    defaultSopsFile = /home/biscotty/.config/sops/age/secrets.yaml;
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

  };
}
