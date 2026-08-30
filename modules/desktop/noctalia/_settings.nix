{
}:

{
  accessibility = {
    ui_scale = 1.25;
  };
  audio = {
    enable_sounds = true;
  };
  keybinds = {
    down = [
      "Down"
      "Ctrl+n"
    ];
    up = [
      "Up"
      "Ctrl+p"
    ];
  };
  bar = {
    default = {
      background_opacity = 0;
      capsule = true;
      center = [
        "audio_visualizer"
        "media"
      ];
      end = [
        "tray"
        "notifications"
        "clipboard"
        "network"
        "bluetooth"
        "volume"
        "brightness"
        "battery"
        "control-center"
        "clock"
        "session"
      ];
      layer = "top";
      margin_edge = 6;
      margin_ends = 24;
      position = "left";
      start = [
        "launcher"
        "workspaces"
      ];
    };
  };
  location = {
    auto_locate = true;
  };
  lockscreen_widgets = {
    enabled = false;
    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };
    schema_version = 2;
    widget = {
      "lockscreen-login-box@DP-2" = {
        box_height = 196;
        box_width = 810;
        cx = 2560;
        cy = 1258;
        output = "DP-2";
        rotation = 0;
        settings = {
          background_color = "surface_variant";
          background_opacity = 0.88;
          background_radius = 12;
          center_password_text = false;
          input_opacity = 1;
          input_radius = 6;
          layout = "regular";
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_media = true;
          show_session_buttons = true;
          show_unlock_hint = true;
          show_weather = true;
        };
        type = "login_box";
      };
      "lockscreen-login-box@HDMI-A-2" = {
        box_height = 196;
        box_width = 810;
        cx = 1920;
        cy = 1978;
        output = "HDMI-A-2";
        rotation = 0;
        settings = {
          background_color = "surface_variant";
          background_opacity = 0.88;
          background_radius = 12;
          center_password_text = false;
          input_opacity = 1;
          input_radius = 6;
          layout = "regular";
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_media = true;
          show_session_buttons = true;
          show_unlock_hint = true;
          show_weather = true;
        };
        type = "login_box";
      };
    };
    widget_order = [
      "lockscreen-login-box@HDMI-A-2"
      "lockscreen-login-box@DP-2"
    ];
  };
  shell = {
    screen_time_enabled = true;
    settings_window_translucent = true;
  };
  theme = {
    builtin = "Nord";
  };
  wallpaper = {
    default = {
      path = "/home/quirinecker/.config/backgrounds/wallhaven-p2ojjm.jpg";
    };
    directory = "/home/quirinecker/.config/backgrounds";
    last = {
      path = "/home/quirinecker/.config/backgrounds/wallhaven-p2ojjm.jpg";
    };
    monitors = {
      DP-2 = {
        path = "/home/quirinecker/.config/backgrounds/wallhaven-p2ojjm.jpg";
      };
      HDMI-A-2 = {
        path = "/home/quirinecker/.config/backgrounds/wallhaven-p2ojjm.jpg";
      };
    };
  };
  widget = {
    control-center = {
      glyph = "adjustments-horizontal";
    };
    workspaces = {
      show_labels = false;
    };
  };
}
