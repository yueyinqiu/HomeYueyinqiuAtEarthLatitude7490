{ pkgs, ... }:
let
  emacs = pkgs.emacs-pgtk;
in
{
  # A few CLI helpers that Emacs packages commonly integrate with.
  home.packages = with pkgs; [
    ripgrep
    fd
    coreutils
  ];

  programs.emacs = {
    enable = true;
    package = emacs;

    # Keep package choice modest but immediately useful:
    # - minibuffer completion stack: vertico + marginalia + consult + orderless
    # - in-buffer completion: corfu + cape
    # - actions: embark (+ consult integration)
    extraPackages = epkgs: with epkgs; [
      # Nix
      nix-mode
      nixfmt

      # Completion UI (minibuffer)
      vertico
      orderless
      marginalia
      consult

      # Actions
      embark
      embark-consult

      # Completion UI (in-buffer)
      corfu
      cape

      # Discoverability / QoL
      which-key
      doom-themes
      doom-modeline
      rainbow-delimiters

      # Project / VCS
      projectile
      magit

      # Diagnostics
      flycheck
    ];

    extraConfig = ''
      ;; ------------------------------
      ;; Basics
      ;; ------------------------------
      (setq standard-indent 2
            inhibit-startup-screen t
            ring-bell-function 'ignore
            make-backup-files nil
            auto-save-default nil
            create-lockfiles nil
            use-short-answers t
            custom-file (locate-user-emacs-file "custom.el"))

      (when (file-exists-p custom-file)
        (load custom-file))

      (global-display-line-numbers-mode 1)
      (column-number-mode 1)
      (show-paren-mode 1)
      (global-hl-line-mode 1)

      (setq-default indent-tabs-mode nil)
      (electric-pair-mode 1)
      (savehist-mode 1)
      (recentf-mode 1)

      ;; ------------------------------
      ;; Theme / modeline
      ;; ------------------------------
      (load-theme 'doom-one t)
      (setq doom-modeline-height 26)
      (doom-modeline-mode 1)

      ;; ------------------------------
      ;; Minibuffer completion stack
      ;; ------------------------------
      (setq completion-styles '(orderless basic)
            completion-category-defaults nil
            completion-category-overrides '((file (styles basic partial-completion))))

      (vertico-mode 1)
      (marginalia-mode 1)

      ;; Consult defaults.
      (global-set-key (kbd "C-s") #'consult-line)
      (global-set-key (kbd "C-x b") #'consult-buffer)
      (global-set-key (kbd "C-c i") #'consult-imenu)
      (global-set-key (kbd "C-c g") #'consult-ripgrep)

      ;; ------------------------------
      ;; Actions (Embark)
      ;; ------------------------------
      (global-set-key (kbd "C-.") #'embark-act)
      (global-set-key (kbd "C-;") #'embark-dwim)
      (setq prefix-help-command #'embark-prefix-help-command)

      (with-eval-after-load 'consult
        (with-eval-after-load 'embark-consult
          (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode)))

      ;; ------------------------------
      ;; In-buffer completion (Corfu)
      ;; ------------------------------
      (setq tab-always-indent 'complete)
      (setq corfu-auto t
            corfu-auto-delay 0.1
            corfu-auto-prefix 2
            corfu-cycle t
            corfu-preselect 'first)
      (global-corfu-mode 1)

      ;; Add a few completion sources.
      (add-to-list 'completion-at-point-functions #'cape-file)
      (add-to-list 'completion-at-point-functions #'cape-dabbrev)

      ;; ------------------------------
      ;; Discoverability / QoL
      ;; ------------------------------
      (which-key-mode 1)
      (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

      ;; ------------------------------
      ;; Projects / VCS
      ;; ------------------------------
      (projectile-mode 1)
      (setq projectile-completion-system 'default)
      (global-set-key (kbd "C-c p") #'projectile-command-map)
      (global-set-key (kbd "C-x g") #'magit-status)

      ;; ------------------------------
      ;; Diagnostics
      ;; ------------------------------
      (global-flycheck-mode 1)
    '';
  };
}
