{ ... }:
{
  flake.modules.homeManager.hyprland-options = { lib, ... }: {
      options = {
        dotfiles-modules.hyprland.extraConfig = lib.mkOption {
          type = lib.types.lines;
          default = "";
          description = "Extra config to add to the hyprland config file.";
        };
      };
  };
}
