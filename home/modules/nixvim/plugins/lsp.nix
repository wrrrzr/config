{ config, lib, ... }:

{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim = {
      lsp = {
        inlayHints.enable = true;
        keymaps = [
          {
            key = "K";
            lspBufAction = "hover";
          }
          {
            key = "gD";
            lspBufAction = "declaration";
          }
          {
            key = "gd";
            lspBufAction = "definition";
          }
          {
            key = "gr";
            lspBufAction = "references";
          }
          {
            key = "gI";
            lspBufAction = "implementation";
          }
          {
            key = "gy";
            lspBufAction = "type_definition";
          }
          {
            key = "gca";
            lspBufAction = "code_action";
          }
          {
            key = "gcr";
            lspBufAction = "rename";
          }
          {
            key = "gwl";
            lspBufAction = "list_workspace_folders";
          }
          {
            key = "gwr";
            lspBufAction = "remove_workspace_folder";
          }
          {
            key = "gwa";
            lspBufAction = "add_workspace_folder";
          }
        ];
        servers = {
          "*" = {
            config = {
              root_markers = [
                ".git"
              ];
            };
          };
          rust_analyzer.enable = true;
          ts_ls.enable = true;
          basedpyright.enable = true;
          clangd.enable = true;
          cmake.enable = true;
          jsonls.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
        };
      };
      plugins.fidget.enable = true;
    };
  };
}
