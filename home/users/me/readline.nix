{ ... }:

{
  programs.readline = {
    enable = true;
    bindings = {
      "\\C-H" = "backward-kill-word";
    };
    variables = {
      mark-symlinked-directories = true;
    };
  };
}
