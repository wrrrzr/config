{ config, lib, ... }:

let
  cfg = config.module.nixvim-diagnostic;
in
{
  options.module.nixvim-diagnostic = {
    enable = lib.mkEnableOption "Nixvim diagnostic";
  };
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      diagnostic.settings = {
        virtual_text = {
          spacing = 4;
          prefix = "";
        };
        virtual_lines = {
          current_line = true;
        };
      };
    };
  };
}
