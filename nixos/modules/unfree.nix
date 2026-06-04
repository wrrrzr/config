{ lib, config, ... }:

let
  cfg = config.module.unfree;
in
{
  options.module.unfree = {
    enable = lib.mkEnableOption "Unfree packages manager";
    packages = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      description = "List of allowed unfree packages";
    };
  };
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) cfg.packages;
  };
}
