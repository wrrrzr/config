{
  config,
  lib,
  hostname,
  ...
}:

let
  cfg = config.module.network;
in
{
  options.module.network = {
    enable = lib.mkEnableOption "Network";
  };
  config = lib.mkIf cfg.enable {
    networking.hostName = hostname;

    networking.firewall.enable = false;

    networking.nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];

    services.resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [
        "8.8.8.8"
        "8.8.4.4"
      ];
      dnsovertls = "true";
    };
  };
}
