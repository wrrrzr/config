{ config, lib, ... }:

let
  cfg = config.module.nixvim;
in
{
  imports = [
    ./opts.nix
    ./plugins.nix
    ./mappings.nix
    ./diagnostic.nix
    ./lsp.nix
    ./editor.nix
  ];
  options.module.nixvim = {
    enable = lib.mkEnableOption "Neovim config";
  };
  config = lib.mkIf cfg.enable {
    module = {
      nixvim-lsp.enable = true;
      nixvim-opts.enable = true;
      nixvim-editor.enable = true;
      nixvim-plugins.enable = true;
      nixvim-mappings.enable = true;
      nixvim-diagnostic.enable = true;
    };
  };
}
