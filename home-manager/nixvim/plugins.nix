{
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
          { name = "vsnip"; }
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
        pylsp = {
          enable = true;
          settings.plugins = {
            rope.enable = true;
            mypy.enable = true;
            flake8.enable = true;
          };
        };
        clangd.enable = true;
        lua_ls.enable = true;
        cmake.enable = true;
        jsonls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };
    avante = {
      enable = true;
      settings = {
        provider = "openrouter";
        providers.openrouter = {
          __inherited_from = "openai";
          endpoint = "https://openrouter.ai/api/v1";
          api_key_name = "OPENROUTER_API_KEY";
          model = "openai/gpt-oss-20b:free";
          disable_tools = true;
          extra_request_body = {
            reasoning_effort = "low";
          };
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    cmp-vsnip.enable = true;

    web-devicons.enable = true;
    lualine.enable = true;
    gitsigns.enable = true;
    git-conflict.enable = true;
  };
}
