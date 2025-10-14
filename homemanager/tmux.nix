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
      bind C-j display-popup -E "tms switch"
      bind C-o display-popup -E "tms"
      set-option -g mode-keys vi
      set -g mouse on
    '';

    programs.tmux.plugins = [
      pkgs.tmuxPlugins.nord
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
      pkgs.tmux-sessionizer
    ];

    xdg.configFile = {
      "tms/config.toml".source =
        ./tms/config.toml;
    };
  };
}
