{ config, lib, ... }:

let
  cfg = config.module.nixvim;
in
{
  imports = [
    ./lsp.nix
    ./opts.nix
    ./editor.nix
    ./plugins.nix
    ./hardmode.nix
    ./mappings.nix
    ./diagnostic.nix
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
      nixvim-hardmode.enable = true;
      nixvim-mappings.enable = true;
      nixvim-diagnostic.enable = true;
    };
  };
}
