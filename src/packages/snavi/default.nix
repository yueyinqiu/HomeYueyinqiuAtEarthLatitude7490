{
  pkgs,
  lib,
  config,
  nur,
  ...
}:
let
  my-snavi-global = pkgs.writeShellApplication {
    name = "my-snavi-global";
    text = ''
      exec "${nur.yueyinqiu.snavi}/bin/Snavi" run \
        --dotnet "${pkgs.dotnetCorePackages.sdk_10_0}/bin/dotnet" \
        --fzf "${pkgs.fzf}/bin/fzf" \
        ${lib.concatStringsSep " " (
          lib.imap0 (
            index: _: ''"-c" "''${XDG_CONFIG_HOME:-$HOME/.config}/snavi/cheats/${toString index}/cheat.json"''
          ) config.my.snavi-global-cheats
        )}
    '';
  };
in
{
  options.my.snavi-global-cheats = lib.mkOption {
    type = lib.types.listOf (
      lib.types.submodule {
        options = {
          cheat = lib.mkOption {
            type = lib.types.str;
          };
          extraFiles = lib.mkOption {
            type = lib.types.attrsOf lib.types.str;
            default = { };
          };
        };
      }
    );
    default = [ ];
  };

  config = {
    xdg.configFile = builtins.listToAttrs (
      builtins.concatLists (
        lib.imap0 (
          index: entry:
          lib.mapAttrsToList (filename: content: {
            name = "snavi/cheats/${toString index}/${filename}";
            value.text = content;
          }) (entry.extraFiles // { "cheat.json" = entry.cheat; })
        ) config.my.snavi-global-cheats
      )
    );

    home.packages = [
      my-snavi-global
    ];

    programs.bash.initExtra = ''
      s() {
        local result="$("${my-snavi-global}/bin/my-snavi-global")"
        echo "$result"
        history -s -- "$result"
        echo "Saved to history."
      }
    '';
  };

  imports = [
    ./cheats
  ];
}
