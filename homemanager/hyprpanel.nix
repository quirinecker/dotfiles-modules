{
  lib,
  config,
  ...
}:
{
  options = {
    modules.hyprpanel.enable = lib.mkEnableOption "hyprpanel";
    modules.hyprpanel.avatar.image = lib.mkOption {
      type = lib.types.path;
      default = "";
      description = "avatar image";
    };

    modules.hyprpanel.avatar.name = lib.mkOption {
      type = lib.types.str;
      default = "John Doe";
      description = "Username to be displayed";
    };
  };

  config = lib.mkIf config.modules.hyprpanel.enable {
    programs.hyprpanel = {
      enable = true;
      settings = {
        scalingPriority = true;
        theme = {
          bar.scaling = 80;
          bar.menus.menu.notifications.scaling = 80;
          bar.menus.menu.dashboard.scaling = 80;
          bar.menus.menu.clock.scaling = 80;
        };
        menus.clock.weather.enabled = false;
        menus.clock.weather.unit = "metric";
        menus.clock.weather.location = "Linz";
        menus.dashboard = {
          powermenu.avatar.name = config.modules.hyprpanel.avatar.name;
          powermenu.avatar.image = config.modules.hyprpanel.avatar.image;
          shortcuts.enabled = false;
        };
        bar.launcher.icon = "";
        terminal = "ghostty";
      };
    };
  };
}
