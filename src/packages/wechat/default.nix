{ pkgs, config, ... }: {
  home.packages = [
    (pkgs.symlinkJoin {
      name = "wechat-fcitx-fake-xdg";
      paths = [ pkgs.wechat ];
      buildInputs = [ pkgs.makeWrapper ];

      # https://zhuanlan.zhihu.com/p/2051087997395808628
      postBuild = ''
        wrapProgram $out/bin/wechat \
          --unset WAYLAND_DISPLAY \
          --set DISPLAY ":0" \
          --set QT_QPA_PLATFORM "xcb" \
          --set GTK_IM_MODULE "fcitx" \
          --set QT_IM_MODULE "fcitx" \
          --set XMODIFIERS "@im=fcitx" \
          --set XDG_CONFIG_HOME "${config.xdg.configHome}/wechat-fake-xdg"
      '';
    })
  ];

  xdg.configFile."wechat-fake-xdg/user-dirs.dirs".text = ''
    XDG_DOCUMENTS_DIR="${config.xdg.dataHome}/wechat-fake-xdg/Documents"
  '';

  imports = [
    ./cheats
  ];
}
