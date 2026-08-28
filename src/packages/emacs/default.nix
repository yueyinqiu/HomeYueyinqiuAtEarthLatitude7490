{pkgs, ...}: {
  # 1. 采用社区已经写好的 Purcell / Bedrock 这种全家桶预设
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;

    # 直接开启全套现代化 UI 和补全全家桶（相当于 nvf 的 full preset）
    extraPackages = epkgs:
      with epkgs; [
        # 1. 现代搜索与补全全家桶
        vertico # 极其流畅的 Cmd 弹窗搜索
        marginalia # 搜索菜单旁边的富文本提示
        consult # 类似 Telescope 的全局搜索
        orderless # 模糊匹配引擎
        corfu # 代码自动补全弹窗 (类似 nvim-cmp)

        # 2. 编程与 LSP 全家桶
        lsp-mode # LSP 核心引擎
        lsp-ui # LSP 悬浮窗与诊断 UI
        csharp-mode # C# 语言支持
        treesit-grammars.with-all-grammars # 全套 Tree-sitter 语法高亮

        # 3. 界面与项目管理全家桶
        doom-themes # 顶级的现代配色主题
        doom-modeline # 漂亮的底部状态栏
        nerd-icons # 完美的图标渲染
        magit # 终端里最强 Git 客户端
        envrc # 自动加载 direnv / nix 环境
      ];

    # 预设的启动脚本：直接把上面全家桶的开关全拉满！
    extraConfig = ''
      ;; --- 全家桶预设启动 ---
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (global-display-line-numbers-mode 1)

      ;; 开启 UI 全家桶
      (load-theme 'doom-one t)
      (doom-modeline-mode 1)
      (vertico-mode 1)
      (marginalia-mode 1)
      (global-corfu-mode 1)

      ;; 开启 C# 与 LSP
      (require 'lsp-mode)
      (add-hook 'csharp-mode-hook #'lsp-deferred)
    '';
  };

  # 2. 把 C# 和系统工具链一并打包给它
  home.packages = with pkgs; [
    csharp-ls # Roslyn LSP
    dotnet-sdk
    ripgrep # 快速搜索引擎
    fd
  ];
}
