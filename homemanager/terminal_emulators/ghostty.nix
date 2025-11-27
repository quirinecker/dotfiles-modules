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
      pkgs.nerd-fonts.jetbrains-mono
    ];

    programs.ghostty.enable = true;
    programs.ghostty.settings = {

      theme = "Nord";
      window-decoration = false;
      gtk-tabs-location = "hidden";
      background-opacity = 0.8;
      window-padding-x = 20;
      window-padding-y = 20;
      cursor-style = "bar";

      # ProFont
      # font-family = "ProFont IIx Nerd Font";
      # font-family-bold = MesloLGS NF Bold;
      # font-family-italic = MesloLGS NF Italic;
      # font-family-bold-italic = MesloLGS NF Bold Italic;

      # JetBrainsMono
      font-family = "JetBrainsMono NF";
      # font-family-bold = MesloLGS NF Bold;
      # font-family-italic = MesloLGS NF Italic;
      # font-family-bold-italic = MesloLGS NF Bold Italic;
      font-style = false;

      shell-integration = "fish";
      shell-integration-features = "no-cursor";

      font-feature = [
        "ss01"
        "ss02"
        "ss03"
        "ss04"
        # "-liga, -calt, -dlig"
      ];
      keybind = [
        "clear"
        "ctrl+comma=open_config"
        "shift+insert=paste_from_selection"
        "ctrl+page_down=next_tab"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+alt+up=goto_split:up"
        "ctrl+shift+a=select_all"
        "super+ctrl+shift+plus=equalize_splits"
        "shift+up=adjust_selection:up"
        "alt+five=goto_tab:5"
        "super+ctrl+right_bracket=goto_split:next"
        "ctrl+equal=increase_font_size:1"
        "ctrl+shift+o=new_split:right"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+q=quit"
        "ctrl+shift+n=new_window"
        "ctrl+shift+page_down=jump_to_prompt:1"
        "ctrl+shift+comma=reload_config"
        "ctrl+minus=decrease_font_size:1"
        "shift+left=adjust_selection:left"
        "super+ctrl+shift+up=resize_split:up,10"
        "alt+eight=goto_tab:8"
        "shift+page_up=scroll_page_up"
        "ctrl+alt+shift+j=write_screen_file:open"
        "ctrl+shift+left=previous_tab"
        "ctrl+shift+w=close_tab"
        "shift+end=scroll_to_bottom"
        "ctrl+zero=reset_font_size"
        "alt+three=goto_tab:3"
        "ctrl+shift+j=write_screen_file:paste"
        "ctrl+page_up=previous_tab"
        "shift+right=adjust_selection:right"
        "ctrl+tab=next_tab"
        "ctrl+alt+left=goto_split:left"
        "shift+page_down=scroll_page_down"
        "ctrl+shift+right=next_tab"
        "ctrl+shift+page_up=jump_to_prompt:-1"
        "alt+nine=last_tab"
        "ctrl+shift+t=new_tab"
        "shift+down=adjust_selection:down"
        "super+ctrl+shift+left=resize_split:left,10"
        "ctrl+shift+tab=previous_tab"
        "alt+two=goto_tab:2"
        "ctrl+alt+down=goto_split:down"
        "super+ctrl+shift+down=resize_split:down,10"
        "super+ctrl+shift+right=resize_split:right,10"
        "ctrl+plus=increase_font_size:1"
        "alt+four=goto_tab:4"
        "ctrl+insert=copy_to_clipboard"
        "ctrl+shift+e=new_split:down"
        "ctrl+alt+right=goto_split:right"
        "alt+f4=close_window"
        "alt+one=goto_tab:1"
        "ctrl+shift+enter=toggle_split_zoom"
        "shift+home=scroll_to_top"
        "super+ctrl+left_bracket=goto_split:previous"
        "ctrl+shift+i=inspector:toggle"
        "alt+six=goto_tab:6"
        "alt+seven=goto_tab:7"
      ];

    };
  };
}
