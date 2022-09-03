{ self, pkgs, ... }: {
  imports = [
    "${inputs.nixos-hardware}/raspberry-pi/3"
    ./hardware-configuration.nix
    ./networking.nix
  ];

  boot = {
    initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
    # ttyAMA0 is the serial console broken out to the GPIO
    kernelParams = [
        "8250.nr_uarts=1"
        "console=ttyAMA0,115200"
        "console=tty1"
    ];

    loader = {
      raspberryPi = {
        enable = true;
        version = 3;
      };
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  mkelley = {
    common.enable = true;
    home =  {
      user = "mkelley";
    };
  };

  environment.systemPackages = with pkgs; [
  ];
}
