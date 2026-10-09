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
  ghostty-yazi-wrapper = pkgs.writeShellApplication {
    name = "ghostty-yazi-wrapper";
    text = ''
      BDUS_METHOD="$1"
      shift 1 # skip BDUS_METHOD

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
            ''y "$@"; exec "${bash}" -l''
            "_"
          ]
        } "''${paths[@]}" &
        disown
        ;;
      "ShowItemProperties")
        YAZI_ID=999999
        ${
          lib.escapeShellArgs [
            ghostty
            "-e"
            bash
            "-lic"
            ''y --client-id 999999 "$@"; exec "${bash}" -l''
            "_"
          ]
        } "''${paths[@]}" &
        disown
        sleep 0.5
        "${ya}" emit-to "$YAZI_ID" spot
        ;;
      esac
    '';
  };
in
{
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;

  xdg.configFile."org.freedesktop.FileManager1.common/config".text = ''
    cmd=${ghostty-yazi-wrapper}/bin/ghostty-yazi-wrapper
  '';
  dbus.packages = [
    pkgs.org-freedesktop-filemanager1-common
  ];

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-termfilechooser
  ];
  xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
    default_dir=$HOME
    env=TERMCMD="${config.programs.ghostty.package}/bin/ghostty" --title="termfilechooser" -e
    open_mode=suggested
    save_mode=last
  '';
}
