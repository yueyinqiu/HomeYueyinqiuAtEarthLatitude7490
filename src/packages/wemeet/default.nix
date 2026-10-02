{ pkgs, ... }: {
  home.packages = [
    (pkgs.wemeet.overrideAttrs (final: prev: {
      postFixup = (prev.postFixup or "") + "\nrm -f $out/bin/wemeet\nsubstituteInPlace $out/share/applications/wemeetapp.desktop --replace-fail \"Exec=wemeet %u\" \"Exec=wemeet-xwayland %u\"\n";
    }))
  ];

  imports = [
    ./cheats.nix
  ];
}
