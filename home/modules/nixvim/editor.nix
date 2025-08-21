{ config, lib, ... }:

let
  cfg = config.module.nixvim-editor;
in
{
  options.module.nixvim-editor = {
    enable = lib.mkEnableOption "Nixvim editor";
  };
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      colorschemes.vscode.enable = true;
      plugins.lz-n.enable = true;
    };
  };
}
