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
    };
  };

  environment.systemPackages = with pkgs; [
    _1password
    htop
    neovim
    tree
    git 
    tmux
    docker
    docker-compose
    which
    go_1_19
    fly
    git-crypt
    openconnect
    vault
  ];
}
