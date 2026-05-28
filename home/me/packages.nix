{ pkgs, ... }:

let
  packages-dev = with pkgs; [
    autoconf
    automake
    black
    cargo
    clang-tools
    cmake
    gcc
    gdb
    gh
    gnumake
    go
    isort
    libtool
    lua
    luarocks
    ninja
    nixfmt
    pkg-config
    rustc
    stylua
    tree-sitter
    valgrind
    (python3.withPackages (
      p: with p; [
        flake8
        autoflake
      ]
    ))
  ];
  packages-cli = with pkgs; [
    acpi
    alsa-utils
    bc
    cloc
    fastfetch
    ffmpeg-full
    file
    gettext
    glow
    hollywood
    iamb
    libnotify
    lolcat
    nmap
    progress
    qemu
    ripgrep
    screen
    senpai
    smartmontools
    tree
    unzip
    wl-clipboard
    xclip
    yt-dlp
  ];
  packages-gui = with pkgs; [
    blueman
    dino
    evince
    gimp
    keepassxc
    kitty
    luanti
    nicotine-plus
    obs-studio
    pavucontrol
    supertuxkart
  ];
in
{
  home.packages = packages-dev ++ packages-cli ++ packages-gui;
}
