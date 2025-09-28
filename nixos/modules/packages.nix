{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    htop
    kitty
    lm_sensors
  ];
}
