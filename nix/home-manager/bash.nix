{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      pysrc = "source venv/bin/activate";
      senv = "source .env";
      neo = "ssh neo@neo";
      neos = "scp -r src/ neo@neo:/home/neo/aichat/";
    };
    initExtra = ''
      curd() {
          local d=save/mm/daily/$(date '+%Y-%m-%d'.md)
          [[ -s $d ]] || cp save/mm/templates/daily.md $d
          $EDITOR $d
      }
    '';
  };
}
