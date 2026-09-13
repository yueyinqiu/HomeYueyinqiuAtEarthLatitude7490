{ ... }:
{
  imports = [
    ./35-220-164-252-3888.nix
  ];

  programs.zed-editor.userSettings = {
    edit_predictions = {
      open_ai_compatible_api = {
        model = "";
        api_url = "";
      };
    };

    proxy = "";

    disable_ai = false;

    agent = {
      use_modifier_to_send = true;
      default_profile = "write";
      sidebar_side = "right";
      dock = "right";
      button = true;
      favorite_models = [ ];
      model_parameters = [ ];
      tool_permissions = {
        default = "allow";
        tools = {
          terminal = {
            default = "allow";
            always_allow = [ ];
          };
        };
      };
      sandbox_permissions = {
        allow_unsandboxed = true;
        allow_fs_write_all = false;
        allow_all_hosts = true;
      };
    };
  };
}
