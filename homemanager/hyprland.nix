{
  lib,
  config,
  pkgs,
  ...
}:
let
  defaultBrowser = "zen-beta";
in
{
  options = {
    modules.hyprland.enable = lib.mkEnableOption "hyprland";
    modules.hyprland.hardwareConfig = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "extra configuration that is hardware specific";
    };
  };

  config = lib.mkIf config.modules.hyprland.enable {
    home.packages = [
      pkgs.hyprpicker
    ];

    xdg.configFile = {
      "hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hyprland.lua;

      # The stups get linked to the config directory as well in order to use the autocomplete without copying it over in other places.
      "hypr/hl.meta.lua".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hl.meta.lua;
      "hypr/hypridle.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hypridle.conf;
      "backgrounds".source = config.lib.file.mkOutOfStoreSymlink ./backgrounds;

      "hypr/hyprland_hardware.lua".text = config.modules.hyprland.hardwareConfig;

      "hypr/nix.conf".text = ''
        $defaultBrowser=${defaultBrowser}
      '';

      "hypr/scripts/gpu-screen-recorder/save-replay.sh".source =
        config.lib.file.mkOutOfStoreSymlink ./hyprland/scripts/gpu-screen-recorder/save-replay.sh;
      "hypr/scripts/gpu-screen-recorder/start-replay.sh".source =
        config.lib.file.mkOutOfStoreSymlink ./hyprland/scripts/gpu-screen-recorder/start-replay.sh;
    };
  };
}
