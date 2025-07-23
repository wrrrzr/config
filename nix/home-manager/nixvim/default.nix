{ config, pkgs, ... }:

{
  imports = [ ./opts.nix ./plugins.nix ./mappings.nix ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.vscode.enable = true;
  };
}
