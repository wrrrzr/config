{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.module.printers;
  driver = pkgs.hplipWithPlugin;
in
{
  options.module.printers = {
    enable = lib.mkEnableOption "things to print paper";
    allowUnfreeHplip = lib.mkOption {
      default = false;
      example = true;
      description = "Allow use unfree package";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = [ driver ];
    };
    environment.systemPackages = [ driver ];
    module.unfree = {
      enable = lib.mkIf cfg.allowUnfreeHplip (lib.mkDefault true);
      packages = lib.mkIf cfg.allowUnfreeHplip [ "hplip" ];
    };
    programs.system-config-printer.enable = true;
  };
}
