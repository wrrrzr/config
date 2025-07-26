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
    pkgs.file
    pkgs.gimp
    pkgs.gh
    pkgs.keepassxc
    pkgs.pavucontrol
    pkgs.pidgin
    pkgs.espeak
    pkgs.jdk17
    pkgs.unzip
    pkgs.ninja
    pkgs.android-studio
    pkgs.fzf
    pkgs.kdePackages.kdenlive
    pkgs.blender
    pkgs.nmap
    pkgs.helvum
    pkgs.obs-studio
    pkgs.cloc
    pkgs.superTux
    pkgs.superTuxKart
    pkgs.dino
    pkgs.mpv
    pkgs.glow
    pkgs.yt-dlp

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

    (pkgs.python3.withPackages (p: with p; [ flake8 autoflake ]))
  ];
}
