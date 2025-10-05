{
  config,
  lib,
  mylib,
  ...
}:

let
  cfg = config.module.wireguard;
  server-addr = "217.114.2.138";
in
{
  options.module.wireguard = {
    enable = lib.mkEnableOption "Wireguard vpn";
    address = lib.mkOption {
      type = lib.types.str;
      example = "10.0.0.1";
    };
  };
  config = lib.mkIf cfg.enable {
    networking.wg-quick.interfaces = {
      wg0 = {
        address = [ cfg.address ];
        privateKey = mylib.readSecret "wireguardkey";

        peers = [
          {
            publicKey = "b7junNwKwlw/0i5GbQ/SXdZKMcwYcMcUGCCnAt1Yyk8=";
            allowedIPs = [ "10.0.0.0/24" ];
            endpoint = "${server-addr}:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
