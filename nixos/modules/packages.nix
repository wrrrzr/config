{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    kitty
    lm_sensors
    usbutils
    vim
    wget
  ];
}
