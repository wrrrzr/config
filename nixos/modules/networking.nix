{
  config,
  lib,
  hostname,
  ...
}:

let
  cfg = config.module.networking;
in
{
  options.module.networking = {
    enable = lib.mkEnableOption "Networking" // {
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    networking.useDHCP = lib.mkDefault true;
    networking.hostName = hostname;
    networking.nameservers = [ "8.8.8.8" ];
    services.resolved = {
      enable = true;
      dnssec = "true";
      dnsovertls = "true";
    };
  };
}
