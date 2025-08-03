{ config, lib, pkgs, hostname, ... }:

let cfg = config.module.network;
in {
  options.module.network = {
    wg = {
      address = lib.mkOption {
        type = lib.types.str;
        example = "10.0.0.1";
      };
    };
  };
  config = {
    networking.hostName = hostname;

    networking.firewall.enable = false;

    networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

    services.resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "8.8.8.8" "8.8.4.4" ];
      dnsovertls = "true";
    };

    networking.extraHosts = ''
      217.114.2.138 tgbots
      10.0.0.3 neo
      10.0.0.4 veryoldideapad
      10.0.0.5 rpi
    '';

    networking.wg-quick.interfaces = {
      wg0 = {
        address = [ cfg.wg.address ];
        dns = [ "8.8.8.8" ];
        privateKeyFile = "/root/wireguardkey";

        peers = [{
          publicKey = "b7junNwKwlw/0i5GbQ/SXdZKMcwYcMcUGCCnAt1Yyk8=";
          allowedIPs = [ "10.0.0.0/24" ];
          endpoint = "tgbots:51820";
          persistentKeepalive = 25;
        }];
      };
    };
  };
}
