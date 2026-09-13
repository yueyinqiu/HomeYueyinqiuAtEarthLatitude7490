{ ... }:
{
  imports = [
    ./ai
    ./languages
  ];

  programs.zed-editor.userSettings = {
    # --- UI ---
    diff_view_style = "split";

    collaboration_panel = {
      button = false;
    };

    outline_panel = {
      button = false;
    };

    window_decorations = "client";

    bottom_dock_layout = "contained";

    preview_tabs = {
      enabled = true;
    };

    tabs = {
      file_icons = true;
      git_status = false;
    };

    tab_bar = {
      show_pinned_tabs_in_separate_row = false;
      show_tab_bar_buttons = true;
      show_nav_history_buttons = false;
      show = true;
    };

    title_bar = {
      button_layout = "platform_default";
      show_menus = true;
      show_user_picture = true;
      show_user_menu = true;
      show_sign_in = true;
      show_onboarding_banner = true;
      show_project_items = true;
      show_worktree_name = true;
      show_branch_name = true;
      show_branch_status_icon = true;
    };

    debugger = {
      button = true;
    };

    diagnostics = {
      button = true;
    };

    terminal = {
      toolbar = {
        breadcrumbs = false;
      };
      show_count_badge = false;
      flexible = true;
      button = true;
    };

    status_bar = {
      show_active_file = true;
      line_endings_button = true;
      cursor_position_button = true;
      active_encoding_button = "enabled";
      active_language_button = true;
    };

    project_panel = {
      auto_open = {
        on_drop = false;
        on_paste = false;
        on_create = true;
      };
      hide_root = false;
      indent_guides = {
        show = "always";
      };
      sticky_scroll = false;
      git_status_indicator = true;
      diagnostic_badges = true;
      bold_folder_labels = false;
      auto_fold_dirs = false;
      auto_reveal_entries = true;
      git_status = true;
      file_icons = true;
      entry_spacing = "comfortable";
      dock = "left";
      button = true;
    };

    search = {
      button = true;
      center_on_match = false;
    };

    toolbar = {
      selections_menu = true;
      quick_actions = true;
      code_actions = true;
      breadcrumbs = true;
    };

    minimap = {
      show = "never";
    };

    gutter = {
      line_numbers = true;
      runnables = true;
    };

    git_panel = {
      group_by = "none";
      show_count_badge = true;
      entry_primary_click_action = "file_diff";
      diff_stats = true;
      file_icons = true;
      tree_view = true;
      collapse_untracked_diff = false;
      dock = "left";
    };

    theme = "One Dark";
    icon_theme = "Colored Zed Icons Theme Light";

    # --- editor ---
    ui_font_size = 16;
    buffer_font_size = 15;

    soft_wrap = "none";

    vim = {
      toggle_relative_line_numbers = true;
    };
    vim_mode = false;
    helix_mode = false;

    inlay_hints = {
      enabled = false;
    };

    indent_guides = {
      line_width = 1;
      enabled = true;
    };

    show_wrap_guides = true;

    relative_line_numbers = "disabled";

    auto_signature_help = true;

    scroll_beyond_last_line = "one_page";

    restore_on_file_reopen = true;

    seed_search_query_from_cursor = "never";

    completions = {
      lsp_insert_mode = "replace_suffix";
    };

    document_symbols = "on";
    document_folding_ranges = "on";
    lsp_results_location = "multi_buffer";
    semantic_tokens = "combined";

    completion_menu_item_kind = "symbol";
    completion_menu_scrollbar = "auto";

    always_treat_brackets_as_autoclosed = false;
    use_auto_surround = false;
    use_autoclose = false;

    ensure_final_newline_on_save = false;
    remove_trailing_whitespace_on_save = false;

    calls = {
      mute_on_join = true;
    };

    git = {
      inline_blame = {
        enabled = false;
      };
    };

    auto_update = false;
    restore_on_startup = "launchpad";
    use_system_path_prompts = true;
    cli_default_open_behavior = "new_window";
    default_open_behavior = "new_window";

    session = {
      restore_unsaved_buffers = false;
      trust_all_worktrees = false;
    };
  };
}
