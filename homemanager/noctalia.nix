{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    modules.noctalia.enable = lib.mkEnableOption "noctalia";
  };

  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia-shell.enable = true;
    programs.noctalia-shell.settings =
      (builtins.fromJSON (builtins.readFile ./noctalia/config.json)).settings;
    home.file."${config.home.homeDirectory}/Pictures/Wallpapers".source = ./backgrounds;
  };

}
