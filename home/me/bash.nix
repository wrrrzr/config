{ ... }:

{
  programs = {
    bash = {
      enable = true;
      initExtra = ''
        curd() {
            local d=~/mm/daily/$(date '+%Y-%m-%d'.md)
            [[ -s $d ]] || ~/save/gendaily > $d
            $EDITOR $d
        }
      '';
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
