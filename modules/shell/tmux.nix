{ ... }:
{
  flake.modules.homeManager.tmux =
    {
      pkgs,
      ...
    }:
    {
      programs.tmux.enable = true;

      programs.tmux.extraConfig = ''
        set -sg escape-time 0
        set -g base-index 1
        set -g default-terminal "tmux-256color"
        set -as terminal-features ",xterm-256color:RGB"
        unbind C-o
        unbind C-j
        bind-key "C-j" display-popup -E -w 80% -h 70% -s none -S none -b none "tv sesh"

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

      # tmux sessionizer + dependencies
      programs.zoxide.enable = true;
      programs.zoxide.enableFishIntegration = true;
      programs.sesh = {
        enable = true;
        enableAlias = true;

        # will be managed by television
        enableTmuxIntegration = false;

        settings = {
          wildcard = [
            {
              pattern = "~/projects/**";
              startup_command = "nvim .";
              windows = [
                "run"
                "scratch"
              ];
            }
            {
              pattern = "~/.config/dotfiles";
              startup_command = "nvim .";
              windows = [
                "run"
                "scratch"
              ];
            }
            {
              pattern = "~/Nextcloud/obsidian/Personal";
              startup_command = "nvim index.md";
            }
          ];
          window =
            let
              mapToFullObjects = map (x: {
                name = x;
              });
            in
            (mapToFullObjects [
              "run"
              "scratch"
            ])
            ++ [

            ];
        };
      };

      programs.television = {
        enable = true;
        enableFishIntegration = true;
        settings = {
          ui.input_bar.position = "bottom";
        };
      };
    };
}
