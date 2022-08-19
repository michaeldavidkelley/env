{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "8.8.8.8"
 ];
    defaultGateway = "10.124.56.1";
    defaultGateway6 = "";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="10.124.57.75"; prefixLength=21; }
        ];
        ipv4.routes = [ { address = "10.124.56.1"; prefixLength = 32; } ];
      };

    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="1a:98:98:eb:3f:52", NAME="eth0"

  '';
}
