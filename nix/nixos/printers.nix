{ pkgs, config, lib, ... }:

let cfg = config.module.printers;
in {
  options.module.printers = {
    enable = lib.mkEnableOption "Enable things to print paper";
  };
  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };
    programs.system-config-printer.enable = true;
  };
}
