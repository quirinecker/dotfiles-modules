{ ... }:
let
  defaultBrowser = "zen-beta";
in
{
  flake.modules.nixos.hyprland = { ... }: {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  flake.modules.homeManager.hyprland = { pkgs, config, ... }: {
    home.packages = [
      pkgs.hyprpicker
      pkgs.hypridle
      pkgs.hyprshot
      pkgs.hyprland-preview-share-picker
    ];

    xdg.configFile = {
      "hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hyprland.lua;

      # The stups get linked to the config directory as well in order to use the autocomplete without copying it over in other places.
      "hypr/hl.meta.lua".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hl.meta.lua;
      "hypr/hypridle.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/hypridle.conf;
      "backgrounds".source = config.lib.file.mkOutOfStoreSymlink ./backgrounds;

      "hypr/nix.conf".text = ''
        $defaultBrowser=${defaultBrowser}
      '';

      "hypr/xdph.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland/xdph.conf;

      "hypr/scripts/gpu-screen-recorder/save-replay.sh".source =
        config.lib.file.mkOutOfStoreSymlink ./hyprland/scripts/gpu-screen-recorder/save-replay.sh;
      "hypr/scripts/gpu-screen-recorder/start-replay.sh".source =
        config.lib.file.mkOutOfStoreSymlink ./hyprland/scripts/gpu-screen-recorder/start-replay.sh;
    };

  };
}
