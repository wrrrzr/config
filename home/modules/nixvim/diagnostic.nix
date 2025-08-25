{ config, lib, ... }:

{
  config = lib.mkIf config.module.nixvim.enable {
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
