{ pkgs, config, ... }:
let
  ya = "${config.programs.yazi.package}/bin/ya";
  bash = "${pkgs.bash}/bin/bash";
  ghostty = "${pkgs.ghostty}/bin/ghostty";
  ghostty-yazi-wrapper = pkgs.writeShellScript "ghostty-yazi-wrapper" ''
    BDUS_METHOD="$1"
    shift 1 # skip BDUS_METHOD
    declare -a item

    quote_string() {
      local input="$1"
      echo "'${""}''${input//\'/\'\\\'\'}'"
    }

    for arg in "$@"; do
      decoded_arg=$(printf '%b' "''${arg//%/\\x}")
      item+=("$(quote_string "$decoded_arg")")
    done

    case "$BDUS_METHOD" in
    "ShowFolders" | "ShowItems")
      eval "${ghostty} -e ${bash}/bin/bash -lic 'y "$@"; exec ${bash}/bin/bash -l' _ ''${item[@]}" &
      disown
      ;;
    "ShowItemProperties")
      YAZI_ID=999999
      eval "${ghostty} -e ${bash}/bin/bash -lic 'y --client-id 999999 "$@"; exec ${bash}/bin/bash -l' _ ''${item[@]}" &
      disown
      sleep 0.5
      "${ya}" emit-to $YAZI_ID spot
      ;;
    esac
  '';
in
{
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;

  xdg.configFile."org.freedesktop.FileManager1.common/config".text = ''
    cmd=${ghostty-yazi-wrapper}
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
