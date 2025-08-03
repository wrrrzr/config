{
  programs.nixvim.keymaps = [
    {
      key = "-";
      mode = [ "n" ];
      action = ":Oil<CR>";
    }
    {
      key = "<C-x>";
      mode = [ "n" ];
      action = ":BufferLineCloseOthers<CR>";
    }
    {
      key = "<Tab>";
      mode = [ "n" ];
      action = ":BufferLineCycleNext<CR>";
    }
    {
      key = "<s-Tab>";
      mode = [ "n" ];
      action = ":BufferLineCyclePrev<CR>";
    }
  ];
}
