{ self, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
  ];

  system.stateVersion = "22.05";

  mkelley = {
    common.enable = true;
    dev.enable = true;
    home =  {
      user = "mkelley";
      includeDOVPN = true;
      gitconfig = "mkelley";
    };
  };

  environment.systemPackages = with pkgs; [
    fly
    openconnect
    vault
    go_1_19
  ];
}
