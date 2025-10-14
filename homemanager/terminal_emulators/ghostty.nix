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
    modules.terminalEmulators.ghostty.enable = lib.mkEnableOption "ghostty";
  };

  config = lib.mkIf config.modules.terminalEmulators.ghostty.enable {
    home.packages = [
      pkgs.ghostty
      pkgs.nerd-fonts.profont
      pkgs.nerd-fonts.heavy-data
      pkgs.meslo-lgs-nf
    ];
    xdg.configFile = {
      "ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ./ghostty/config;
    };
  };
}
