{
  config,
  lib,
  pkgs,
  nur,
  ...
}:

let
  mixin = nur.yueyinqiu.mihomo-manager-mihomo-mixin;
  tui = pkgs.callPackage ./mihomo-tui { };

  actions = name: {
    restart = ''
      #!/usr/bin/env bash
      systemctl --user restart "mihomo-proxies-${name}"
    '';

    log = ''
      #!/usr/bin/env bash
      journalctl --user -uf "mihomo-proxies-${name}"
    '';

    tui = ''
      #!/usr/bin/env bash
      ${tui}/bin/mihomo-tui -c "${config.xdg.stateHome}/proxies/state/${name}/tui/config.yaml"
    '';

    "with" = ''
      #!/usr/bin/env bash
      export ALL_PROXY="http://127.0.0.1:${toString config.my.proxies.${name}.port}"
      export HTTP_PROXY="$ALL_PROXY"
      export HTTPS_PROXY="$ALL_PROXY"
      export all_proxy="$ALL_PROXY"
      export http_proxy="$ALL_PROXY"
      export https_proxy="$ALL_PROXY"
      exec "$@"
    '';

    info = ''
      #!/usr/bin/env bash
      printf "Port: %s\n" "${toString config.my.proxies.${name}.port}"
      printf "Configuration: %s\n" "${config.xdg.configHome}/proxies/${name}"
      printf "State Directory: %s\n" "${config.xdg.stateHome}/proxies/state/${name}"
    '';
  };

  allScripts = lib.concatMap (
    name:
    lib.mapAttrsToList (action: text: {
      path = "${action}/${name}";
      file = (
        pkgs.writeTextFile {
          name = "mihomo-proxies-${action}-${name}";
          text = text;
          executable = true;
        }
      );
    }) (actions name)
  ) (builtins.attrNames config.my.proxies);

  libexecTree = pkgs.runCommand "mihomo-proxies-libexec" { } (
    lib.concatMapStringsSep "\n" (script: ''
      install -Dm755 '${script.file}' "$out/libexec/${script.path}"
    '') allScripts
  );
in
{
  options.my.proxies = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          port = lib.mkOption {
            type = lib.types.port;
          };
          files = lib.mkOption {
            type = lib.types.listOf lib.types.path;
          };
        };
      }
    );
    default = { };
  };

  imports = [
    ./ye-sha-yun
    ./bai-piao-ji-chang
    ./pjlab
    ./tongji
    ./cheats
  ];

  config = {
    programs."sub-nix" = {
      enable = true;
      clis.mihomo-proxies = {
        version = "0.0.0";
        src = libexecTree;
      };
    };

    home.packages = [
      pkgs.mihomo
      mixin
      tui

      (pkgs.writeShellApplication {
        name = "my-proxies-mihomo-tui";
        text = ''
          exec mihomo-tui -c "${config.xdg.stateHome}/proxies/state/''$1/tui/config.yaml"
        '';
      })
      (pkgs.writeShellApplication {
        name = "my-proxies-with";
        text = ''
          PORT=$(cat "${config.xdg.stateHome}/proxies/state/$1/meta/port")
          export ALL_PROXY="http://127.0.0.1:$PORT"
          export HTTP_PROXY="$ALL_PROXY"
          export HTTPS_PROXY="$ALL_PROXY"
          export all_proxy="$ALL_PROXY"
          export http_proxy="$ALL_PROXY"
          export https_proxy="$ALL_PROXY"
          exec "''${@:2}"
        '';
      })
    ];

    xdg.configFile = lib.mergeAttrsList (
      lib.mapAttrsToList (
        name: item:
        builtins.listToAttrs (
          map (file: {
            name = "proxies/${name}/${baseNameOf file}";
            value = {
              source = file;
            };
          }) item.files
          ++ [
            {
              name = "proxies/${name}/my-proxies.yaml";
              value = {
                text = builtins.toJSON {
                  proxies = lib.mapAttrsToList (name: item: {
                    name = "my-proxies-${name}";
                    type = "socks5";
                    server = "127.0.0.1";
                    port = item.port;
                  }) config.my.proxies;
                };
              };
            }
            {
              name = "proxies/${name}/restart.sh";
              value = {
                text = ''
                  systemctl --user restart "proxies-${name}.service"
                '';
              };
            }
          ]
        )
      ) config.my.proxies
    );

    systemd.user.services = lib.mapAttrs' (
      name: item:
      let
        portYaml = pkgs.writeText "proxies-${name}-port.yaml" ''
          mixed-port: ${toString item.port}
        '';

        runner = pkgs.writeShellScript "proxies-${name}-run" ''
          set -e

          cd "${config.xdg.configHome}/proxies/${name}"
          mkdir -p "/tmp/config-sh"
          mkdir -p "$STATE_DIRECTORY/config-sh"
          MMMM="${mixin}/bin/MihomoManager.MihomoMixin" \
            OUTPUT_PATH="/tmp/merged.yaml" \
            TEMP_DIRECTORY="/tmp/config-sh" \
            STATE_DIRECTORY="$STATE_DIRECTORY/config-sh" \
            bash config.sh

          mkdir -p "$STATE_DIRECTORY/core"
          "${mixin}/bin/MihomoManager.MihomoMixin" merge /tmp/merged.yaml merge "${portYaml}" save "$STATE_DIRECTORY/core/config.yaml"

          SOCKET="$XDG_RUNTIME_DIR/proxies-${name}.sock"

          mkdir -p "$STATE_DIRECTORY/tui"
          cd "$STATE_DIRECTORY/tui"
          cat > config.yaml << EOF
          mihomo-api: unix:$SOCKET
          EOF

          mkdir -p "$STATE_DIRECTORY/meta"
          cd "$STATE_DIRECTORY/meta"
          cat > port << EOF
          ${toString item.port}
          EOF

          cd "$STATE_DIRECTORY/core"
          SAFE_PATHS="$STATE_DIRECTORY" exec "${pkgs.mihomo}/bin/mihomo" -d . -ext-ctl-unix "$SOCKET"
        '';
      in
      lib.nameValuePair "proxies-${name}" {
        Unit = {
          Description = "proxies Service ${name}";
          After = [ "network-online.target" ];
          Wants = [ "network-online.target" ];
        };
        Install.WantedBy = [ "default.target" ];
        Service = {
          ExecStart = "${runner}";
          Restart = "on-failure";
          RestartSec = "5s";
          PrivateTmp = true;
          StateDirectory = "proxies/state/${name}";
        };
      }
    ) config.my.proxies;
  };
}
