{ pkgs, nix-wpsoffice-cn, ... }: {
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    corefonts
    nix-wpsoffice-cn.chinese-fonts
    maple-mono.Normal-NF-CN

    (pkgs.writeShellApplication {
      name = "my-fontconfig-find-family";
      text = ''
        fc-list : family | sort -u | grep -i "''$1"
      '';
    })
  ];

  fonts.fontconfig = {
    enable = true;

    antialiasing = true;
    hinting = "full";
    subpixelRendering = "rgb";

    defaultFonts = {
      serif = [ "NSimSun" ];
      sansSerif = [ "Microsoft YaHei" ];
      monospace = [ "NSimSun" ];
    };

    configFile.yahei-no-ui = {
      enable = true;
      text = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <rejectfont>
            <glob>*/msyh.ttf</glob>
            <glob>*/msyhbd.ttf</glob>
          </rejectfont>
          <match target="pattern">
            <test name="family"><string>Microsoft YaHei UI</string></test>
            <edit name="family" mode="assign"><string>Microsoft YaHei</string></edit>
          </match>
        </fontconfig>
      '';
    };
  };

  imports = [
    ./cheats.nix
  ];
}
