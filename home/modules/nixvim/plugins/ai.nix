{
  pkgs,
  config,
  lib,
  ...
}:

let
  avante-package = pkgs.vimPlugins.avante-nvim.overrideAttrs {
    version = "0.0.25";
    src = pkgs.fetchFromGitHub {
      owner = "yetone";
      repo = "avante.nvim";
      tag = "v0.0.25";
      sha256 = "lmyooXvQ+Cqv/6iMVlwToJZMFePSWoVzuGVV7jsSOZc=";
    };
  };
  avante-model = "x-ai/grok-code-fast-1";
in
{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim.plugins = {
      avante = {
        enable = true;
        package = avante-package;
        settings = {
          provider = "openrouter";
          providers.openrouter = {
            __inherited_from = "openai";
            endpoint = "https://openrouter.ai/api/v1";
            api_key_name = "OPENROUTER_API_KEY";
            model = avante-model;
            extra_request_body.reasoning_effort = "low";
          };
        };
      };
    };
  };
}
