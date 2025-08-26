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
    disko
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.installer = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxVzlnNIpKHwyy6Yw5lctgo0JplO0AXtuiDYVzy5A0s"
    ];
  };

  environment.enableAllTerminfo = true;

  security.sudo.wheelNeedsPassword = false;

  networking.firewall.enable = false;
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
