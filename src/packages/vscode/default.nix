{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.profiles.default.extensions =
    with pkgs.vscode-extensions;
    [
      jbockle.jbockle-format-files
      mkhl.direnv

      james-yu.latex-workshop

      yzhang.markdown-all-in-one
      bierner.markdown-mermaid

      mechatroner.rainbow-csv

      tamasfe.even-better-toml

      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit

      ms-python.python
      ms-python.flake8

      ms-dotnettools.csdevkit

      jnoortheen.nix-ide

      yy0931.vscode-sqlite3-editor
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-explorer";
        publisher = "ms-vscode";
        version = "0.5.0";
        sha256 = "sha256-BNsnetpddxv3Y9MjZERU5jOq1I2g6BNFF1rD7Agpmr8=";
      }
      {
        name = "visual-studio-2019-themes-extracted-from-csharp-extension";
        publisher = "yueyinqiu";
        version = "0.0.4";
        sha256 = "sha256-/NqpkW/a1vGW4vBtGfIG8qfJWciA3C3qVj8pP2ve3fw=";
      }
    ];

  imports = [
    ./cheats
  ];

  home.packages = [
    (pkgs.writeShellApplication {
      name = "c";
      text = ''
        exec code "$@"
      '';
    })
  ];
}
