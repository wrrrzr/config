{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    home-manager
    git
    gnumake
    cmake
    gcc
    python3
    cargo
    rustc
    htop
    ffmpeg-full
    neofetch
    alsa-utils
    gettext
    autoconf
    automake
    libtool
    pkg-config
  ];
}
