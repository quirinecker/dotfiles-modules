{ ... }: {
  flake.modules.nixos.keyd = {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "esc";
            };
            alt = {
              u = "G-u";
              a = "G-a";
              o = "G-o";
              s = "G-s";
              U = "G-U";
              A = "G-A";
              O = "G-O";
              S = "G-S";
            };
          };
        };
      };
    };
  };
}
