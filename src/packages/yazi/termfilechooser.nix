{
  pkgs,
  config,
  lib,
  ...
}:
let
  ghostty = "${config.programs.ghostty.package}/bin/ghostty";
  termfilechooser = pkgs.xdg-desktop-portal-termfilechooser;

  yazi-escaped = lib.escapeShellArg "${config.programs.yazi.package}/bin/yazi";
  yazi-wrapper = pkgs.runCommand "yazi-wrapper.sh" { } ''
    substitute ${lib.escapeShellArg "${termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh"} \
      $out \
      --replace-fail 'cmd="yazi"' ${lib.escapeShellArg "cmd=${yazi-escaped}"}
    chmod +x $out
  '';
in
{
  xdg.portal.extraPortals = [
    termfilechooser
  ];
  xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=${lib.escapeShellArg (lib.escapeShellArg yazi-wrapper)}
    env=TERMCMD=${
      lib.escapeShellArg (
        lib.escapeShellArgs [
          ghostty
          "--title=termfilechooser"
          "-e"
        ]
      )
    }
    default_dir=$HOME
    open_mode=suggested
    save_mode=last
  '';
}
