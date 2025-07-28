{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    hello
    nerd-fonts.jetbrains-mono
    telegram-desktop
    kitty
    luanti
    code-cursor
    file
    gimp
    gh
    keepassxc
    pavucontrol
    pidgin
    espeak
    jdk17
    unzip
    ninja
    android-studio
    nmap
    helvum
    obs-studio
    cloc
    superTux
    superTuxKart
    dino
    mpv
    glow
    yt-dlp
    firefox

    cargo
    rustc
    ffmpeg-full
    alsa-utils
    gdb
    gnumake
    cmake
    gcc
    autoconf
    automake
    libtool
    pkg-config

    nixfmt-classic
    stylua
    black
    isort

    tree-sitter
    lua
    nodejs
    luarocks
    ripgrep
    wl-clipboard
    xclip

    (python3.withPackages (p: with p; [ flake8 autoflake ]))
  ];
}
