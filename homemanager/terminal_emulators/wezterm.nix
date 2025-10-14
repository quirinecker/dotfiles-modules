{ lib, config, ... }:
let
  configHome = "${config.home.homeDirectory}/.config/dotfiles/homes/quirinecker";
in
{
  options = {
    modules.terminalEmulators.wezterm.enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.modules.terminalEmulators.wezterm.enable {
    programs.wezterm.enable = true;
    xdg.configFile = {
      "wezterm/wezterm.lua".source =
        config.lib.file.mkOutOfStoreSymlink ./wezterm/wezterm.lua;
    };
  };
}
