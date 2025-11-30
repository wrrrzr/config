{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.module.security;
  udevRule =
    name: text:
    pkgs.writeTextFile {
      inherit name text;
      destination = "/etc/udev/rules.d/${name}.rules";
    };
in
{
  options.module.security = {
    enable = lib.mkEnableOption "Security";
    disallowCamera = lib.mkEnableOption "Disallow camera for non-root";
  };
  config = lib.mkIf cfg.enable {
    services.udev.packages = lib.mkIf cfg.disallowCamera (
      lib.mapAttrsToList udevRule {
        "72-remove-access-permissions" = ''
          KERNEL=="video[0-9]*", MODE="0600", TAG-="uaccess"
        '';
      }
    );
  };
}
