{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.module.transmission;
in
{
  options.module.transmission = {
    enable = lib.mkEnableOption "Transmission";
  };
  config = lib.mkIf cfg.enable {
    services.transmission = {
      enable = true;
      package = pkgs.transmission_4;
    };
  };
}
