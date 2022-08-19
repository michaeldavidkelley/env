{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.mkelley.common;
in {
  options = {
    mkelley.common = {
      enable = mkEnableOption "Common configuration";
    };
  };

  config = mkIf cfg.enable {
    nix = {
      package = pkgs.nixUnstable;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };

    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        (import ../../overlays/mosh.nix)
      ];
    };

    time.timeZone = "America/New_York";

    boot = {
      cleanTmpDir = true;
      kernel.sysctl = {
        "fs.inotify.max_user_watches" = "1048576";
        "net.ipv4.ip_forward" = "1";
      };
    };

    security.sudo.wheelNeedsPassword = false;

    networking.firewall = {
      allowPing = true;
    };

    virtualisation = {
      docker.enable = true;
    };

    users.mutableUsers = false;

    environment.systemPackages = with pkgs; [
      _1password
      curl
      dnsutils
      docker
      docker-compose
      file
      fish
      fzf
      gcc
      git
      gnumake
      gnupg
      htop
      inetutils
      jq
      mosh
      nix-index
      openssl
      tmux
      tree
      unzip
      wget
      go
    ];

    programs = {
      fish.enable = true;
      mosh.enable = true;
    };
    services.openssh = {
      enable = true;
      passwordAuthentication = false;
    };
    services.cron = {
      enable = true;
    };
  };
}
