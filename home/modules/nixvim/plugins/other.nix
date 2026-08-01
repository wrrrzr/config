{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim.plugins = {
      oil = {
        enable = true;
        settings.view_options.is_hidden_file = ''
          function(name, bufnr)
              hidden_files = {
                  ["__pycache__"] = true,
                  ["venv"] = true,
              }
              if hidden_files[name] then
                  return true
              elseif vim.startswith(name, ".") then
                  return true
              end
              return false
          end
        '';
      };
      bufferline = {
        enable = true;
        settings.options = {
          mode = "buffers";
          diagnostics = "nvim_lsp";
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            python = [
              "autoflake"
              "black"
              "isort"
            ];
            nix = [ "nixfmt" ];
            cpp = [ "clang-format" ];
            rust = [ "rustfmt" ];
          };
          formatters = {
            autoflake.command = lib.getExe pkgs.autoflake;
            black.command = lib.getExe pkgs.black;
            clang-format.command = lib.getExe' pkgs.clang-tools "clang-format";
            isort.command = lib.getExe pkgs.isort;
            nixfmt.command = lib.getExe pkgs.nixfmt;
            rustfmt.command = lib.getExe pkgs.rustfmt;
            stylua.command = lib.getExe pkgs.stylua;
          };
          format_on_save = {
            timeout_ms = 5000;
          };
        };
      };
      treesitter = {
        enable = true;
        settings.highlight.enable = true;
      };
      web-devicons.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      fugitive.enable = true;
    };
  };
}
