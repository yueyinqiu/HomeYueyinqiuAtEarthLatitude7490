{
  pkgs,
  config,
  lib,
  ...
}:
let
  ghostty = "${config.programs.ghostty.package}/bin/ghostty";
  bash = "${pkgs.bash}/bin/bash";
  ya = "${config.programs.yazi.package}/bin/ya";
  yazi = "${config.programs.yazi.shellWrapperName}";
  ghostty-yazi-wrapper = pkgs.writeShellApplication {
    name = "ghostty-yazi-wrapper";
    text = ''
      BDUS_METHOD="$1"
      shift 1

      paths=()
      for arg in "$@"; do
        decoded=$(printf '%b' "''${arg//%/\\x}")
        paths+=("$decoded")
      done

      case "$BDUS_METHOD" in
      "ShowFolders" | "ShowItems")
        ${
          lib.escapeShellArgs [
            ghostty
            "-e"
            bash
            "-lic"
            '''${yazi}' "$@"; exec '${bash}' -l''
            "_"
          ]
        } "''${paths[@]}" &
        disown
        ;;
      "ShowItemProperties")
        ${
          lib.escapeShellArgs [
            ghostty
            "-e"
            bash
            "-lic"
            '''${yazi}' "$@"; exec '${bash}' -l''
            "_"
            "--client-id"
          ]
        } $$ "''${paths[@]}" &
        disown
        for _ in {1..30}; do
          "${ya}' emit-to $$ spot && break
          sleep 0.2
        done
        ;;
      esac
    '';
  };
in
{
  xdg.configFile."org.freedesktop.FileManager1.common/config".text = ''
    cmd=${ghostty-yazi-wrapper}/bin/ghostty-yazi-wrapper
  '';
  dbus.packages = [
    pkgs.org-freedesktop-filemanager1-common
  ];
}
