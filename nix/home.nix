{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.hello
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.telegram-desktop
    pkgs.kitty
    pkgs.luanti
    pkgs.code-cursor
    pkgs.neovim
    pkgs.file
    pkgs.gimp
    pkgs.gh
    pkgs.keepassxc

    pkgs.lua-language-server
    pkgs.python313Packages.python-lsp-server
    pkgs.clang-tools
    pkgs.rust-analyzer
    pkgs.cmake-language-server
    pkgs.gopls
    pkgs.python313Packages.flake8

    pkgs.stylua
    pkgs.black
    pkgs.python313Packages.autoflake
    pkgs.isort

    pkgs.tree-sitter
    pkgs.lua
    pkgs.nodejs
    pkgs.luarocks
    pkgs.ripgrep
    pkgs.wl-clipboard
    pkgs.xclip
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      pysrc = "source venv/bin/activate";
      senv = "source .env";
      neo = "ssh neo@neo";
      neos = "scp -r src/ neo@neo:/home/neo/aichat/";
    };
  };

  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 14;
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

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
