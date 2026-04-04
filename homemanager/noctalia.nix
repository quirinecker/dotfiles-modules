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
    services.kdeconnect.enable = true;

    programs.noctalia-shell.enable = true;
    programs.noctalia-shell.settings =
      (builtins.fromJSON (builtins.readFile ./noctalia/config.json)).settings;
    programs.noctalia-shell.plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        kde-connect = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins/";
        };
      };
      version = 2;
    };
    home.file."${config.home.homeDirectory}/Pictures/Wallpapers".source = ./backgrounds;
  };

}
