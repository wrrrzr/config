{ config, lib, ... }:

{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      colorschemes.vscode.enable = true;
      plugins.lz-n.enable = true;
    };
  };
}
