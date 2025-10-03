{
  config,
  lib,
  ...
}:

let
  cfg = config.module.zapret;
in
{
  options.module.zapret = {
    enable = lib.mkEnableOption "Zapret";
  };
  config = lib.mkIf cfg.enable {
    services.zapret = {
      enable = true;
      params = [
        "--dpi-desync=syndata,multisplit --dpi-desync-split-pos=1"
      ];
    };
  };
}
