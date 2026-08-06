{ pkgs, nix-wpsoffice-cn, ... }: {
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    corefonts
    nix-wpsoffice-cn.chinese-fonts

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
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
    };
  };

  imports = [
    ./cheats
  ];

  my.navi-cheats.fonts = ''
    $ keyword: --- --map my-bash-escape-std

    # list all available installed fonts matching a search keyword
    fc-list : family | sort -u | grep -i <keyword>
  '';
}
