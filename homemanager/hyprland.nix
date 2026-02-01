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
    modules.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to enable the hyprland configuration module.
        Warning: This does not include the installation of hyprland itself.
        recommended dependencies:
          hyprpaper
          hypridle
          hyprlock
          hyprshot
          https://github.com/WhySoBad/hyprland-preview-share-picker/tree/master
      '';
    };
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
      "hypr/xdph.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/xdph.conf;
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
