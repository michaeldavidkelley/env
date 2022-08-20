{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "8.8.8.8" ];
    defaultGateway = "165.227.176.1";
    defaultGateway6 = "";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="165.227.190.33"; prefixLength=20; }
          { address="10.17.0.5"; prefixLength=16; }
        ];
        ipv6.addresses = [
          { address="fe80::60b3:eff:fe34:ab8f"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "165.227.176.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = ""; prefixLength = 128; } ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="62:b3:0e:34:ab:8f", NAME="eth0"
    ATTR{address}=="8a:6f:00:8f:ff:23", NAME="eth1"
  '';
}
