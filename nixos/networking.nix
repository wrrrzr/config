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
    networking.nameservers = [ "8.8.8.8" ];
    services.resolved.enable = true;
  };
}
