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
  };
}
