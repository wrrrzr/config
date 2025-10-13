{ ... }:

{
  programs = {
    bash = {
      enable = true;
      initExtra = ''
        curd() {
            local d=~/mm/daily/$(date '+%Y-%m-%d'.md)
            [[ -s $d ]] || cp ~/mm/templates/daily.md $d
            $EDITOR $d
        }
        remind() {
            local msg="$1"
            shift 1
            local when="$*"
            echo "notify-send Reminder '$msg'" | at $when
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
