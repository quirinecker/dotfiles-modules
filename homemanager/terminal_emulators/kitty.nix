{ lib, config, ... }:
{
  options = {
    modules.terminalEmulators.kitty.enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.modules.terminalEmulators.kitty.enable {
    programs.kitty.enable = true;
    programs.kitty.settings = {
      shell = "fish";
      font_family = "MesloLGS NF";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 12;
      background_opacity = 0.4;
      draw_minimal_borders = "yes";
      window_padding_width = 14;
      window_border_width = 0;
      hide_window_decorations = "yes";
      titlebar-only = "yes";
      active_border_color = "none";
      active_tab_title_template = "{fmt.fg._fff}{title}";
      active_tab_foreground = "#fff";
      active_tab_font_style = "bold-italic";
      active_tab_background = "#8631B4";
      inactive_tab_foreground = "#c2c2c2";
      inactive_tab_background = "#8631B4";
    };
  };
}
