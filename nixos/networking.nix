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
    services.resolved.enable = true;
  };
}
