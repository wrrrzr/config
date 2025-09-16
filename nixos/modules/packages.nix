{
  pkgs,
  ...
}:

let
  myvim = (
    pkgs.vim-full.customize {
      vimrcConfig.customRC = ''
        set mouse=
        set number
        syntax on
      '';
    }
  );
in
{
  environment.systemPackages = with pkgs; [
    myvim
    wget
    htop
    gettext
    tree
    lm_sensors
    smartmontools
    git
  ];
}
