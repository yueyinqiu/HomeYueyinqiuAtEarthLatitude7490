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

  my.navi-cheats.git = ''
    $ message: --- --map my-bash-escape-std
    
    # stage all files, including untracked ones, and commit
    git add -A && git commit -m <message>

    # soft undo last commit, keeping all changes staged
    git reset --soft HEAD~1
  '';
}
