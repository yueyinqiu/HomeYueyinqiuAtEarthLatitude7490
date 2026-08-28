{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.nixfmt
    ];
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
}
