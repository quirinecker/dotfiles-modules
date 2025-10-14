{
  lib,
  config,
  ...
}:
let
  theme = import lib/theme.nix;
  starshipLib.toLanguageConfig = symbol: {
    symbol = symbol;
    style = "bg:language";
    format = "[ $symbol ($version) ]($style)";
  };
in
{
  options = {
    modules.starship.enable = lib.mkEnableOption "enables starship";
  };

  config = lib.mkIf config.modules.starship.enable {
    programs.starship.enable = true;
    programs.starship.settings = {
      palette = "default";
      format = lib.concatStrings [
        "[](bg: secondary)"
        "$os"
        "[](fg:secondary bg:primary)"
        "$directory"
        "[](fg:primary bg:#FCA17D)"
        "$git_branch"
        "$git_status"
        "[](fg:#FCA17D bg:language)"
        "$c"
        "$elixir"
        "$elm"
        "$golang"
        "$gradle"
        "$haskell"
        "$java"
        "$julia"
        "$nodejs"
        "$nim"
        "$rust"
        "$scala"
        "$nix_shell"
        "[ ](fg:language)"
      ];

      right_format = "$cmd_duration";

      os = {
        style = "bg:secondary";
        disabled = false; # Disabled by default

        symbols = {
          NixOS = " ";
        };
      };

      directory = {
        style = "bg:primary fg:primary-foreground";
        format = "[ $path ]($style)";
        truncation_length = 1;
        truncation_symbol = "";
      };

      directory.substitutions = {
        "Documents" = "󰈙 Documents";
        "Downloads" = " Downloads";
        "Music" = " Music";
        "Pictures" = "  Pictures";
      };

      nim = starshipLib.toLanguageConfig "󰆥 ";
      rust = starshipLib.toLanguageConfig "";
      java = starshipLib.toLanguageConfig " ";
      golang = starshipLib.toLanguageConfig " ";
      c = starshipLib.toLanguageConfig " ";
      elixir = starshipLib.toLanguageConfig " ";
      elm = starshipLib.toLanguageConfig " ";
      gradle = starshipLib.toLanguageConfig " ";
      haskell = starshipLib.toLanguageConfig " ";
      julia = starshipLib.toLanguageConfig " ";
      nodejs = starshipLib.toLanguageConfig "";
      scala = starshipLib.toLanguageConfig " ";

      nix_shell = {
        symbol = " ";
        style = "bg:language";
        format = "[ $symbol$state( \($name\))]($style)";
        unknown_msg = "nix-shell";
      };

      git_branch = {
        symbol = "";
        style = "bg:#FCA17D";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#FCA17D";
        format = "[ $all_status$ahead_behind ]($style)";
      };

      cmd_duration = {
        min_time = 1000;
        style = "bg:secondary";
        format = ''
          [](bg: secondary)
          [ $duration ]($style)
          [](fg:secondary)
        '';
      };

      palettes.default = {
        primary = theme.primary;
        secondary = theme.secondary;
        accent = theme.accent;
        primary-foreground = theme.primary-foreground;
        git = theme.git;
        language = theme.language;
        docker = theme.docker;
      };
    };
  };
}
