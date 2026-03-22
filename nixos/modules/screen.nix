{
  config,
  lib,
  ...
}:

let
  cfg = config.module.screen;
in
{
  options.module.screen = {
    enable = lib.mkEnableOption "Screen";
  };
  config = lib.mkIf cfg.enable {
    programs.screen.enable = true;
  };
}
