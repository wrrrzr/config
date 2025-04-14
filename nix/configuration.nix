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

  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    dnsovertls = "true";
  };

  networking.extraHosts =
    ''
      217.114.2.138 tgbots
      10.0.0.3 neo
      10.0.0.4 veryoldideapad
      10.0.0.5 rpi
    '';

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.0.0.2" ];
      dns = [ "8.8.8.8" ];
      privateKeyFile = "/root/wireguardkey";

      peers = [
        {
          publicKey = "b7junNwKwlw/0i5GbQ/SXdZKMcwYcMcUGCCnAt1Yyk8=";
          allowedIPs = [ "10.0.0.0/24" ];
          endpoint = "tgbots:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };


  time.timeZone = "Europe/Moscow";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
 
  services.libinput.enable = true;

  services.xserver = {
    enable = true;
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
    cmake
    gcc
    python3
    cargo
    rustc
    htop
    ffmpeg-full
    neofetch
  ];

  programs.sway = {
    enable = true;
    extraPackages = [
      pkgs.wmenu
      pkgs.playerctl
      pkgs.brightnessctl
      pkgs.pulseaudio
      pkgs.grim
      pkgs.swaylock
      pkgs.swaynotificationcenter
      pkgs.imv
      pkgs.mpv
    ];
  };

  systemd.user.units.swaync.enable = true;

  services.postgresql.enable = true;

  services.tlp.enable = true;

  services.ollama.enable = true;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  system.stateVersion = "24.11";
}

