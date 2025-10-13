{ stateVersion, ... }:

{
  imports = [
    ./nixvim
  ];

  home.stateVersion = stateVersion;
  programs.home-manager.enable = true;
}
