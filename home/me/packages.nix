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
    jdk17
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
    ffmpeg-full
    file
    gettext
    glow
    hollywood
    iamb
    libnotify
    lolcat
    neofetch
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
    helvum
    iwgtk
    keepassxc
    kitty
    luanti
    nicotine-plus
    obs-studio
    openscad
    pavucontrol
    superTuxKart
  ];
  packages-fonts = with pkgs; [ nerd-fonts.jetbrains-mono ];
in
{
  home.packages = packages-dev ++ packages-cli ++ packages-gui ++ packages-fonts;
}
