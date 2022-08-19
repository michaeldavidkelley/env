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
          { address="10.124.56.109"; prefixLength=21; }
        ];
        ipv6.addresses = [
          { address="fe80::e4af:85ff:fe09:c3f7"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "10.124.56.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = ""; prefixLength = 128; } ];
      };

    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="e6:af:85:09:c3:f7", NAME="eth0"

  '';
}
