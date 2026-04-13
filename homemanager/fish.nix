{
  lib,
  config,
  pkgs,
  ...
}:
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
