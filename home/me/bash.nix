{ ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      curd() {
          local d=~/mm/daily/$(date '+%Y-%m-%d'.md)
          [[ -s $d ]] || cp ~/mm/templates/daily.md $d
          $EDITOR $d
      }
    '';
  };
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
