{
  pkgs,
  lib,
  modulesPath,
  inputs,
  ...
}:

let
  rpi-libcec = (pkgs.libcec.override { withLibraspberrypi = true; });
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];

  module = {
    emulate = {
      enable = true;
      platforms = [ "x86_64-linux" ];
    };
    networking = {
      enable = true;
      nftables.enable = true;
    };
    openssh.enable = true;
    wireguard = {
      enable = true;
      address = "10.0.0.5/32";
    };
    avahi.enable = true;
    users = {
      enable = true;
      users.tux.enable = true;
    };
  };

  networking = {
    useNetworkd = true;
    bridges.br0 = {
      interfaces = [ "end0" ];
    };
    interfaces.br0 = {
      useDHCP = true;
    };
  };
  users.users.tux = {
    extraGroups = [
      "incus-admin"
      "libvirtd"
    ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rpi-libcec
    libraspberrypi
    qemu_kvm
    virt-manager
    libvirt
    bridge-utils
  ];
  virtualisation = {
    incus = {
      enable = true;
      ui.enable = true;
      preseed = {
        networks = [
          {
            name = "incusbr0";
            type = "bridge";
            config = {
              "ipv4.address" = "10.0.100.1/24";
              "ipv4.nat" = "true";
            };
          }
        ];
        storage_pools = [
          {
            config = {
              source = "/var/lib/incus/storage-pools/default";
            };
            driver = "dir";
            name = "default";
          }
        ];
        profiles = [
          {
            name = "default";
            devices = {
              eth0 = {
                name = "eth0";
                network = "incusbr0";
                type = "nic";
              };
              root = {
                path = "/";
                pool = "default";
                size = "35GiB";
                type = "disk";
              };
            };
          }
        ];
      };
    };

    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu_kvm;
    };
  };

  hardware = {
    deviceTree = {
      enable = true;
      filter = lib.mkForce "*rpi-4-*.dtb";
    };
    raspberry-pi."4" = {
      pwm0.enable = true;
      fkms-3d.enable = true;
      bluetooth.enable = true;
      leds = {
        pwr.disable = true;
        act.disable = true;
      };
    };
    bluetooth.enable = true;
  };

  boot.loader.timeout = 0;
  boot.kernelParams = [
    "quiet"
    "snd_bcm2835.enable_hdmi=1"
  ];
  boot.initrd.availableKernelModules = [ "xhci_pci" ];
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };
}
