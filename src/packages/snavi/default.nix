{
  pkgs,
  lib,
  config,
  nur,
  ...
}:
{
  options.my.snavi-cheats = lib.mkOption {
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
        ) config.my.snavi-cheats
      )
    );

    home.packages = [
      (pkgs.writeShellApplication {
        name = "my-global-snavi";
        text = ''
          exec "${nur.yueyinqiu.snavi}/bin/Snavi" run \
            --dotnet "${pkgs.dotnetCorePackages.sdk_10_0}/bin/dotnet" \
            --fzf "${pkgs.fzf}/bin/fzf" \
            ${lib.concatStringsSep " " (
              lib.imap0 (
                index: _: ''"-c" "''${XDG_CONFIG_HOME:-$HOME/.config}/snavi/cheats/${toString index}/cheat.json"''
              ) config.my.snavi-cheats
            )}
        '';
      })
    ];

    programs.bash.initExtra = ''
      s() {
        local result="$(my-global-snavi)"
        history -s -- "$result"
        echo "$result"
      }
    '';

    my.snavi-cheats = [
      {
        cheat = builtins.toJSON {
          Description = "run snavi, a navi-like interactive command-line cheatsheet tool but it's more safe with structured cheat file and CSharp script support";
          Command = [
            {
              "$type" = "CommandTokenLiteral";
              Value = "my-global-snavi";
            }
          ];
          ExtraArguments = true;
        };
      }
    ];
  };
}
