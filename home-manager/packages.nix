{ config, pkgs, ... }:

let
  packages-dev = with pkgs; [
    code-cursor
    gh
    jdk17
    ninja
    android-studio
    cargo
    rustc
    gdb
    gnumake
    cmake
    gcc
    autoconf
    automake
    libtool
    pkg-config
    nixfmt-rfc-style
    stylua
    black
    isort
    tree-sitter
    lua
    luarocks
    go
    (python3.withPackages (
      p: with p; [
        flake8
        autoflake
      ]
    ))
  ];
  packages-cli = with pkgs; [
    file
    nmap
    cloc
    glow
    acpi
    hollywood
    ffmpeg-full
    alsa-utils
    ripgrep
    wl-clipboard
    xclip
    unzip
    yt-dlp
    espeak
    senpai
  ];
  packages-gui = with pkgs; [
    telegram-desktop
    kitty
    luanti
    gimp
    keepassxc
    pavucontrol
    helvum
    obs-studio
    superTux
    superTuxKart
    firefox
    nicotine-plus
    blueman
    dino
  ];
  packages-fonts = with pkgs; [ nerd-fonts.jetbrains-mono ];
in
{
  nixpkgs.config.allowUnfree = true;

  home.packages = packages-dev ++ packages-cli ++ packages-gui ++ packages-fonts;
}
