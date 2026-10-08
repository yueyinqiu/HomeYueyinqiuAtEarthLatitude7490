{ pkgs, ... }: {
  home.packages = [
    (pkgs.symlinkJoin {
      name = "wemeet-xwayland-only";
      paths = [ pkgs.wemeet ];
      postBuild = ''
        rm -f "$out/bin/wemeet"
        ln -s wemeet-xwayland "$out/bin/wemeet"
      '';
    })
  ];

}
