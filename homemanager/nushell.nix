{
  lib,
  config,
  ...
}:
{
  options = {
    modules.nushell.enable = lib.mkEnableOption "nushell";
  };
  config = lib.mkIf config.modules.nushell.enable {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.config = {
            show_banner: false
            edit_mode: vi
        }
      '';
      shellAliases = {
        v = "steam-run nvim";
        nix-dev = "nix develop --command fish";
        nix-shell = "nix-shell --command 'fish'";
      };
    };
  };
}
