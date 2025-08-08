{
  config,
  pkgs,
  lib,
  ...
}:

let
  mod = "Mod1";
  resize = "10px";
  barcmd = pkgs.writeShellScriptBin "barcmd" ''echo $(cat /sys/class/power_supply/BAT1/capacity)"%" "|" $(date "+%a %F %R")'';
  wallpaper = ./wallpaper.png;
in
{
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    systemd.enable = true;
    config = {
      bars = [
        {
          position = "top";
          colors = {
            statusline = "#ffffff";
            background = "#323232";
          };
          statusCommand = "while ${barcmd}/bin/barcmd; do sleep 1; done";
        }
      ];
      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:win_space_toggle";
          repeat_delay = "500";
          repeat_rate = "30";
        };
        "type:touchpad" = {
          dwt = "disabled";
          drag_lock = "disabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
        };
      };
      output = {
        "*" = {
          bg = "${wallpaper} fill";
        };
      };
      keybindings = {
        "${mod}+Shift+Return" = "exec ${pkgs.kitty}/bin/kitty";
        "${mod}+Shift+c" = "kill";
        "${mod}+p" = "exec ${pkgs.wmenu}/bin/wmenu-run";
        "${mod}+l" = "exec ${pkgs.swaylock}/bin/swaylock";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        "${mod}+Shift+q" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        "${mod}+Shift+e" = "reload";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+f" = "fullscreen";
        "${mod}+r" = "resize";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioPause" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";
        "Print" = "exec ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy";
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
      };
      modes = {
        resize = {
          "Left" = "resize shrink width ${resize}";
          "Down" = "resize grow height ${resize}";
          "Up" = "resize shrink height ${resize}";
          "Right" = "resize grow width ${resize}";
        };
      };
    };
    extraConfig = ''
      default_border none
      default_floating_border none
      titlebar_padding 1
      titlebar_border_thickness 0

      bindswitch lid:on exec swaylock
    '';
  };
  home.packages = with pkgs; [
    kitty
    wmenu
    swaylock
    pulseaudio
    playerctl
    brightnessctl
    grim
    wl-clipboard
    imv
  ];
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      image = "${wallpaper}";
    };
  };
  services.swaync.enable = true;
}
