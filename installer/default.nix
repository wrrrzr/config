{
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  environment.systemPackages = with pkgs; [
    git
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.installer = {
    password = "install";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  networking.firewall.enable = false;
  services.openssh.enable = true;
}
