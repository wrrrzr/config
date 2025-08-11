{
  programs.nixvim = {
    diagnostic.settings = {
      virtual_text = {
        spacing = 4;
        prefix = "";
      };
      virtual_lines = {
        current_line = true;
      };
    };
  };
}
