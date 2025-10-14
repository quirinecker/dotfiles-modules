{ lib, config, ... }:
{
  options = {
    modules.editorconfig.enable = lib.mkEnableOption "enables editorconfig";
  };
  config = lib.mkIf config.modules.editorconfig.enable {
    editorconfig = {
      enable = true;
      settings = {
        "*" = {
          indent_style = "tab";
          indent_size = 4;
          trim_trailing_whitespace = true;
          insert_final_newline = true;
        };
        "*.nix" = {
          indent_style = "space";
          indent_size = 2;
        };
        "*.py" = {
          indent_style = "space";
          indent_size = 4;
        };
        "*.r" = {
          indent_style = "space";
          indent_size = 2;
        };
        "*.R" = {
          indent_style = "space";
          indent_size = 2;
        };
        "*.yaml" = {
          indent_style = "space";
          indent_size = 4;
        };
        "*.yml" = {
          indent_style = "space";
          indent_size = 4;
        };
        "compose.yml" = {
          indent_style = "space";
          indent_size = 2;
        };
        "compose.yaml" = {
          indent_style = "space";
          indent_size = 2;
        };
        "*.c" = {
          indent_style = "space";
          indent_size = 2;
        };
      };
    };
  };
}
