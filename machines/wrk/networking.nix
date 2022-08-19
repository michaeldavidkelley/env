{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    hostName = "wrk";
    nameservers = [ "10.124.57.141" ];
    search = [ "internal.digitalocean.com" "consul" ];
    defaultGateway = "10.124.56.1";
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

  localCommands = ''
      ip=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
      subnet=$(ip route | grep -Po '^\d+(.\d+){3}/\d+(?= dev eth0)')
      gateway=$(ip route | grep -Po '(?<=default via )[.\d]+')
      ip rule delete from $ip table 128 || true
      ip rule add from $ip table 128 || true
      ip route add table 128 to $subnet dev eth0 || true
      ip route add table 128 default via $gateway || true
    '';
  };

  services.udev.extraRules = ''
    ATTR{address}=="1a:98:98:eb:3f:52", NAME="eth0"
  '';
}
