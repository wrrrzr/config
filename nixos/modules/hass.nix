{
  config,
  lib,
  ...
}:

let
  cfg = config.module.hass;
in
{
  options.module.hass = {
    enable = lib.mkEnableOption "Home assistant";
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Whether to open the port in the firewall.";
    };
  };
  config = lib.mkIf cfg.enable {
    services.home-assistant = {
      enable = true;
      openFirewall = cfg.openFirewall;
      extraComponents = [
        "analytics"
        "bluetooth"
        "esphome"
        "google_translate"
        "isal"
        "kodi"
        "met"
        "open_router"
        "piper"
        "radio_browser"
        "rpi_power"
        "shopping_list"
        "telegram_bot"
        "whisper"
        "wyoming"
        "zha"
      ];
      config = {
        default_config = { };
      };
    };
    services.esphome.enable = true;
  };
}
