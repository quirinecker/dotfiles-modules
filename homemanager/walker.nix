{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    modules.walker.enable = lib.mkEnableOption "walker";
  };

  config = lib.mkIf config.modules.walker.enable {
    programs.walker.enable = true;
    programs.walker.config = lib.trivial.importTOML ./walker/walker.toml;

    home.packages = [
      pkgs.libqalculate
    ];

    xdg.configFile = {
      "elephant/menus/pw.toml".source = ./walker/elephant/menus/pw.toml;
      "elephant/elephant.toml".source = ./walker/elephant.toml;
      # "walker/plugins".source =
      #   config.lib.file.mkOutOfStoreSymlink "${configHome}/.config/walker/plugins";
      # "walker/themes".source = config.lib.file.mkOutOfStoreSymlink "${configHome}/.config/walker/themes";
    };
  };
}
