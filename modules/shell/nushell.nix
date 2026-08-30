{ ... }:
{
  flake.modules.homeManager.nushell = { ... }: {
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
