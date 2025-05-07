{ config, lib, pkgs, ... }:

{
  networking.hostName = "mypc";
  networking.networkmanager.enable = true;

  networking.firewall.enable = false;

  networking.nameservers =
    [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
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
      address = [ "10.0.0.2" ];
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
}
