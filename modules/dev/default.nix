{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.mkelley.dev;
in {
  options.nanzhong.dev = {
    enable = mkEnableOption "Dev configuration";
  };

  config =  mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      direnv
      doctl
      fd
      gh
      go
      gopls
      inotify-tools
      lazygit
      lua
      luajit
      mariadb-client
      neovim
      nodejs
      sqlite
    ];

    services.emacs = {
      enable = true;
      package = (pkgs.emacsGit-nox.override {
        nativeComp = true;
        withSQLite3 = true;
      } );
    };
  };
}
