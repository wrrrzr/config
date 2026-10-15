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
    packages = lib.mkOption {
      default = [ ];
      type = with lib.types; listOf package;
    };
    fonts = lib.mkEnableOption "Fonts";
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages =
      with pkgs;
      [
        git
        htop
        kitty.terminfo
        lm_sensors
        nixfmt
        usbutils
        vim
        wget
      ]
      ++ cfg.packages;
    fonts.packages = lib.mkIf cfg.fonts (with pkgs; [ noto-fonts ]);
  };
}
