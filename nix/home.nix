{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.11";

  home.packages = [
    pkgs.hello
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.telegram-desktop
    pkgs.kitty
    pkgs.luanti
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "wozrer@proton.me";
    userName = "wrrrzr";
  };

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      lua-language-server
      python313Packages.python-lsp-server
      clang-tools
      rust-analyzer
      cmake-language-server
      gopls

      stylua
      black
      python313Packages.autoflake
      isort

      ripgrep
      wl-clipboard
      xclip
    ];
  };

  programs.home-manager.enable = true;
}
