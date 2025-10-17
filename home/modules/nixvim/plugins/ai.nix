{
  config,
  lib,
  ...
}:

let
  avante-model = "anthropic/claude-sonnet-4.5";
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
            auto_approve_tool_permissions = [
              "glob"
              "fetch"
              "git_diff"
              "move_path"
              "copy_path"
              "read_file"
              "create_dir"
              "rag_search"
              "web_search"
              "git_commit"
              "delete_path"
              "create_file"
              "search_keyword"
              "replace_in_file"
              "read_file_toplevel_symbols"
            ];
          };
        };
      };
    };
  };
}
