{
  lib,
  config,
  pkgs,
  ...
}:
let
  configHome = "${config.home.homeDirectory}/.config/dotfiles/homes/quirinecker";
in
{
  options = {
    modules.tmux.enable = lib.mkEnableOption "tmux";
  };

  config = lib.mkIf config.modules.tmux.enable {
    programs.tmux.enable = true;

    programs.tmux.extraConfig = ''
      set -sg escape-time 0
      set -g base-index 1
      set -g default-terminal "screen-256color"
      unbind C-o
      unbind C-j
      bind-key "C-j" run-shell "sesh connect \"$(
        sesh list --icons | fzf-tmux -p 80%,70% \
          --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
          --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
          --bind 'tab:down,btab:up' \
          --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
          --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
          --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
          --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
          --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
          --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
          --preview-window 'right:55%' \
          --preview 'sesh preview {}'
      )\""

      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."

      set-option -g mode-keys vi
      set -g mouse on
      set -g status on

      set -g focus-events on
      set -g status-style bg=default
      set -g status-right '#(cat #{socket_path}-\#{session_id}-vimbridge-R)'
      set -g status-left '#(cat #{socket_path}-\#{session_id}-vimbridge)'
      set -g status-left-length 99
      set -g status-right-length 99
      set -g status-justify absolute-centre
    '';

    programs.tmux.plugins = [
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '1' # minutes
        '';
      }
    ];

    home.packages = [
      # tmux sessionizer + dependencies
      pkgs.sesh
      pkgs.zoxide
      pkgs.fzf
    ];

    xdg.configFile = {
      "tms/config.toml".source = ./tms/config.toml;
    };
  };
}
