{ config, lib, ... }:

{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim.plugins = {
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
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;
    };
  };
}
