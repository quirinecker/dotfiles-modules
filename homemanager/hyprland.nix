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
  };

  config = lib.mkIf config.modules.hyprland.enable {
    home.packages = [
      pkgs.hyprpicker
    ];

    xdg.configFile = {
      "hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hyprland.conf;
      "hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hyprpaper.conf;
      "hypr/hypridle.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hypridle.conf;
      "hypr/hyprlock.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hyprlock.conf;
      "backgrounds".source = config.lib.file.mkOutOfStoreSymlink ./backgrounds;

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
