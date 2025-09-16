{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.module.greetd;
in
{
  options.module.greetd = {
    enable = lib.mkEnableOption "Greetd";
  };
  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -c sway";
        user = "greeter";
      };
    };
  };
}
