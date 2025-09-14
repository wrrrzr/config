{
  config,
  lib,
  ...
}:

let
  cfg = config.module.waydroid;
in
{
  options.module.waydroid = {
    enable = lib.mkEnableOption "Waydroid";
  };
  config = lib.mkIf cfg.enable {
    virtualisation.waydroid.enable = true;
  };
}
