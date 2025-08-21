{ config, lib, ... }:

let
  cfg = config.module.nixvim-plugins;
in
{
  options.module.nixvim-plugins = {
    enable = lib.mkEnableOption "Nixvim plugins";
  };
  config = lib.mkIf cfg.enable {
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
      cmp = {
        enable = true;
        settings = {
          experimental.ghost_text = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" =
              "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}), {'i', 's'})";
            "<S-Tab>" =
              "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}), {'i', 's'})";
          };
          window = {
            completion.border = "rounded";
            documentation.border = "rounded";
          };
        };
        cmdline = {
          "/" = {
            mapping.__raw = "cmp.mapping.preset.cmdline()";
            sources = [ { name = "buffer"; } ];
          };
          "?" = {
            mapping.__raw = "cmp.mapping.preset.cmdline()";
            sources = [ { name = "buffer"; } ];
          };
          ":" = {
            mapping.__raw = "cmp.mapping.preset.cmdline()";
            sources = [
              { name = "path"; }
              { name = "cmdline"; }
            ];
          };
        };
      };
      treesitter = {
        enable = true;

        settings.highlight.enable = true;
      };
      codecompanion = {
        enable = true;

        settings = {
          adapters = {
            openrouter = {
              __raw = ''
                function()
                  return require("codecompanion.adapters").extend("openai_compatible", {
                      env = {
                          url       = "https://openrouter.ai/api",
                          api_key   = "OPENROUTER_API_KEY",
                          chat_url  = "/v1/chat/completions",
                      },
                      schema = {
                          model = {
                              default = "mistralai/mistral-small-3.2-24b-instruct:free",
                          },
                      },
                  })
                end
              '';
            };
          };

          strategies = {
            agent = {
              adapter = "openrouter";
            };
            chat = {
              adapter = "openrouter";
            };
            inline = {
              adapter = "openrouter";
            };
          };
        };
      };

      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;

      web-devicons.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      git-conflict.enable = true;
      fugitive.enable = true;
      render-markdown = {
        enable = true;
        settings = {
          file_types = [
            "markdown"
            "codecompanion"
          ];
        };
      };
    };
  };
}
