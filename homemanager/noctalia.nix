{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    modules.noctalia.enable = lib.mkEnableOption "noctalia";
    modules.noctalia.isLaptop = lib.mkOption {
      type = lib.types.bool;
      default = { };
    };
  };

  config = lib.mkIf config.modules.noctalia.enable {
    services.kdeconnect.enable = true;

    programs.noctalia-shell.enable = true;
    programs.noctalia-shell.settings = (import ./noctalia/settings.nix) {isLaptop = config.modules.isLaptop;};
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
