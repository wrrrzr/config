{ config, lib, ... }:

let
  render-markdown-ft = [
    "markdown"
    "Avante"
  ];
in
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
          };
          format_on_save = {
            timeout_ms = 5000;
            lsp_fallback = true;
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
      git-conflict.enable = true;
      fugitive.enable = true;
      render-markdown = {
        enable = true;
        settings.file_types = render-markdown-ft;
        lazyLoad.settings.ft = render-markdown-ft;
      };
    };
  };
}
