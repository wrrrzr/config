{
  lib,
  config,
  ...
}:

let
  cfg = config.module.bash;
in
{
  options.module.bash = {
    enable = lib.mkEnableOption "Bash" // {
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    programs.bash.promptInit = ''
      PROMPT_COLOR="1;31m"
      ((UID)) && PROMPT_COLOR="1;32m"
      PS1="\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
    '';
  };
}
