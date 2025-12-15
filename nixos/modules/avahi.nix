{ lib, config, ... }:

let
  cfg = config.module.avahi;
in
{
  options.module.avahi = {
    enable = lib.mkEnableOption "Lan discovery daemon";
  };
  config = lib.mkIf cfg.enable {
    services.avahi.enable = true;
  };
}
