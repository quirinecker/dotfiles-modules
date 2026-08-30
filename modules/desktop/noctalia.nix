{ ... }: {
  flake.modules.homeManager.noctalia = { ... }: {

    programs.noctalia = {
      enable = true;
      settings = (import ./noctalia/_settings.nix) { };
    };

  };
}
