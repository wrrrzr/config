{ config, pkgs, ... }:

{
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
    pkgs.pavucontrol
    pkgs.pidgin

    pkgs.lua-language-server
    pkgs.clang-tools
    pkgs.rust-analyzer
    pkgs.cmake-language-server
    pkgs.gopls

    pkgs.nixfmt-classic
    pkgs.stylua
    pkgs.black
    pkgs.isort

    pkgs.tree-sitter
    pkgs.lua
    pkgs.nodejs
    pkgs.luarocks
    pkgs.ripgrep
    pkgs.wl-clipboard
    pkgs.xclip

    (pkgs.python3.withPackages (p:
      with p; [
        python-lsp-server
        pylsp-rope
        pylsp-mypy
        pyls-flake8

        flake8
        autoflake
      ]))
  ];
}
