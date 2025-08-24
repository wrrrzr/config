{ config, lib, ... }:

let
  cfg = config.module.nixvim-lsp;
in
{
  options.module.nixvim-lsp = {
    enable = lib.mkEnableOption "Nixvim lsp";
  };
  config = lib.mkIf cfg.enable {
    programs.nixvim.plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        keymaps.lspBuf = {
          "K" = "hover";
          "gD" = "declaration";
          "gd" = "definition";
          "gr" = "references";
          "gI" = "implementation";
          "gy" = "type_definition";
          "gca" = "code_action";
          "gcr" = "rename";
          "gwl" = "list_workspace_folders";
          "gwr" = "remove_workspace_folder";
          "gwa" = "add_workspace_folder";
        };
        servers = {
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          basedpyright.enable = true;
          clangd.enable = true;
          lua_ls.enable = true;
          cmake.enable = true;
          jsonls.enable = true;
          nixd.enable = true;
          nil_ls.enable = true;
          ts_ls.enable = true;
        };
      };
      fidget.enable = true;
    };
  };
}
