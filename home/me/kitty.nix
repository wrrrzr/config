{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = -1;
    };
    shellIntegration.enableBashIntegration = true;
    enableGitIntegration = true;
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMonoNL NF";
      size = 13;
    };
    themeFile = "VSCode_Dark";
  };
}
