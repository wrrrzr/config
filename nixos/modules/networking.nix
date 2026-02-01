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
    nftables.enable = lib.mkEnableOption "Nftables";
  };
  config = lib.mkIf cfg.enable {
    networking = {
      hostName = hostname;
      nameservers = [ "8.8.8.8" ];
      nftables.enable = cfg.nftables.enable;
      useDHCP = lib.mkDefault true;
    };
    services.resolved.enable = true;
  };
}
