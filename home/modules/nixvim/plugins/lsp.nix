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
          basedpyright = {
            enable = true;
            config = {
              cmd = [
                "basedpyright-langserver"
                "--stdio"
              ];
              filetypes = [
                "python"
              ];
              root_markers = [
                "pyproject.toml"
              ];
            };
          };
          clangd = {
            enable = true;
            config = {
              cmd = [
                "clangd"
                "--background-index"
              ];
              filetypes = [
                "c"
                "cpp"
              ];
              root_markers = [
                "compile_commands.json"
              ];
            };
          };
          nixd = {
            enable = true;
            config = {
              cmd = [
                "nixd"
              ];
              filetypes = [
                "nix"
              ];
              root_markers = [
                "flake.nix"
              ];
            };
          };
        };
      };
      plugins.fidget.enable = true;
    };
  };
}
