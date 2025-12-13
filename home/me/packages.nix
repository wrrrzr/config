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
    valgrind
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
    clang-tools
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
    senpai
    screen
    libnotify
    bc
    lolcat
    progress
    qemu
    neofetch
    iamb
    gettext
    tree
    smartmontools
  ];
  packages-gui = with pkgs; [
    kitty
    luanti
    gimp
    keepassxc
    pavucontrol
    helvum
    obs-studio
    superTuxKart
    nicotine-plus
    dino
    evince
    blueman
    iwgtk
    openscad
  ];
  packages-fonts = with pkgs; [ nerd-fonts.jetbrains-mono ];
in
{
  home.packages = packages-dev ++ packages-cli ++ packages-gui ++ packages-fonts;
}
