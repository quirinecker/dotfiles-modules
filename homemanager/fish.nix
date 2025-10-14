{
  lib,
  config,
  pkgs,
  ...
}:
let
  createDummyTmuxSessionScript = ./fish/create_dummy_tmux_session.nu;
in
{
  options = {
    modules.fish.enable = lib.mkEnableOption "fish";
  };

  config = lib.mkIf config.modules.fish.enable {
    home.packages = [
      pkgs.lsd
    ];

    programs.fish = {
      enable = true;
      shellInit = ''
        # this creates a dummy tmux session if none exists
        # it is for loading the continuum restore plugin
        ${lib.getExe pkgs.nushell} ${createDummyTmuxSessionScript}
        fish_vi_key_bindings
        set -g fish_color_command brblue
        set fish_greeting
      '';
      shellAliases = {
        v = "nvim";
        ls = "lsd";
        nix-shell = "nix-shell --command 'fish'";
        nix-dev = "nix develop --command fish";
        gnome-control-center = "nix-shell -p gnome-control-center --run 'XDG_CURRENT_DESKTOP=GNOME gnome-control-center'";
      };
    };

  };
}
