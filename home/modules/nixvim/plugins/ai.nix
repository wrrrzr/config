{
  config,
  lib,
  ...
}:

let
  avante-model = "x-ai/grok-code-fast-1";
in
{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim.plugins = {
      avante = {
        enable = true;
        settings = {
          provider = "openrouter";
          providers.openrouter = {
            __inherited_from = "openai";
            endpoint = "https://openrouter.ai/api/v1";
            api_key_name = "OPENROUTER_API_KEY";
            model = avante-model;
            extra_request_body.reasoning_effort = "low";
          };
          behaviour = {
            auto_approve_tool_permissions = true;
          };
        };
      };
    };
  };
}
