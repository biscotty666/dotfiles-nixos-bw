{ inputs, config, ... }:
{
  imports = [
    #inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    
    defaultSopsFile = secrets/age/secrets.yaml;
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "secrets/age/keys.txt";
      generateKey = true;
    };

    secrets = {
      restic-password = {
        owner = biscotty.name;
      };
    };

  };
}
