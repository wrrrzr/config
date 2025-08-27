{ pkgs, ... }:

let
  packages-dev = with pkgs; [
    gh
    jdk17
    ninja
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
    screen
    libnotify
    aichat
    bc
    lolcat
    progress
  ];
  packages-gui = with pkgs; [
    kitty
    luanti
    gimp
    keepassxc
    pavucontrol
    helvum
    obs-studio
    superTux
    superTuxKart
    nicotine-plus
    gajim
    evince
    blueman
  ];
  packages-fonts = with pkgs; [ nerd-fonts.jetbrains-mono ];
in
{
  home.packages = packages-dev ++ packages-cli ++ packages-gui ++ packages-fonts;
}
