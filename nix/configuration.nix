{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "mypc";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
 
  services.libinput.enable = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
    xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    }; 
  };

  programs.bash.promptInit = ''
  if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
    PROMPT_COLOR="1;31m"
    ((UID)) && PROMPT_COLOR="1;32m"
    if [ -n "$INSIDE_EMACS" ]; then
      # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
      PS1="\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
    else
      PS1="\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
    fi
    if test "$TERM" = "xterm"; then
      PS1="\[\033]2;\h:\u:\w\007\]$PS1"
    fi
  fi
'';

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    home-manager
    git
    gnumake
    gcc
  ];

  system.stateVersion = "24.11";
}

