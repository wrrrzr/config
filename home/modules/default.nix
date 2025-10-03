{ stateVersion, ... }:

{
  imports = [
    ./nixvim
    ./reminders.nix
  ];

  home.stateVersion = stateVersion;
  programs.home-manager.enable = true;
}
