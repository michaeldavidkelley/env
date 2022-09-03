{ lib, ... }: {
  networking = {
    hostName = "nixpi";
    dhcpcd.enable = true;
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = false;
    };
  };
}
