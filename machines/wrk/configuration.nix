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
    };
  };

  environment.systemPackages = with pkgs; [
    fly
    openconnect
    vault
  ];
}
