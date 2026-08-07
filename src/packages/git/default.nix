{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings.user = {
      name = "yueyinqiu";
      email = "yueyinqiu@outlook.com";
    };
    lfs.enable = true;
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "my-git-add-commit";
      text = ''
        git add -A && git commit -m "''$1"
      '';
    })
  ];

  imports = [
    ./cheats
  ];
}
