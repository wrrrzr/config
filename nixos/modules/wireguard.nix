{
  config,
  lib,
  ...
}:

let
  cfg = config.module.wireguard;
  server = {
    addr = "195.133.201.240";
    port = 51820;
    pubkey = "zUzJMvvEAqj8o8jcc4AFsXwqC7iJ2FWu1f8nkB3j5zE=";
  };
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
    networking.wireguard.interfaces = {
      wg0 = {
        ips = [ cfg.address ];
        privateKeyFile = "/etc/secret/wireguardkey";

        peers = [
          {
            publicKey = server.pubkey;
            allowedIPs = [ "10.20.30.0/24" ];
            endpoint = "${server.addr}:${lib.toString server.port}";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
