{ pkgs, config, ... }:
let
  ghostty-yazi-wrapper = pkgs.writeShellScript "ghostty-yazi-wrapper" ''
    BDUS_METHOD="$1"
    shift 1 # skip BDUS_METHOD
    declare -a item

    quote_string() {
      local input="$1"
      echo "'${""}''${input//\'/\'\\\'\'}'"
    }

    # decode url string + add quote
    for arg in "$@"; do
      decoded_arg=$(printf '%b' "''${arg//%/\\x}")
      item+=("$(quote_string "$decoded_arg")")
    done

    cmd="${config.programs.yazi.package}/bin/yazi"
    termcmd='"${config.programs.ghostty.package}/bin/ghostty" -e'

    case "$BDUS_METHOD" in
    # Since yazi can handle both files, folders
    "ShowFolders" | "ShowItems")
      eval "$termcmd $cmd ''${item[@]}" &
      disown
      ;;
    "ShowItemProperties")
      YAZI_ID=999999
      eval "$termcmd $cmd --client-id $YAZI_ID ''${item[@]}" &
      disown
      # Increase this if yazi take too long to load
      sleep 0.5
      ya emit-to $YAZI_ID spot
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

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-termfilechooser
    pkgs.org-freedesktop-filemanager1-common
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
