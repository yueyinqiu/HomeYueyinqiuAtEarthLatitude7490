{
  name,
  pkgs,
  ...
}:

pkgs.writeShellApplication {
  name = name;
  text = ''
    set -euo pipefail

    exec ${pkgs.json-diff}/bin/json-diff -j \
      "''${XDG_CONFIG_HOME:-$HOME/.config}/zed/settings.json" \
      <(
        nix eval --json \
          '.#homeConfigurations."yueyinqiu@earth-latitude7490".config.programs.zed-editor.userSettings'
      )
  '';
}
