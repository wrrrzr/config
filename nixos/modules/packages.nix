{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.module.packages;
in
{
  options.module.packages = {
    enable = lib.mkEnableOption "Default system packages" // {
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
      htop
      kitty
      lm_sensors
      usbutils
      vim
      wget
    ];
  };
}
