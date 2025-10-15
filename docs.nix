{
  buildDocs =
    {
      pkgs,
      inputs,
      modules,
    }:
    let
      eval = pkgs.lib.evalModules {
        specialArgs = {
          inherit inputs pkgs;
        };
        modules = [
          (
            { ... }:
            {
              imports = modules;
              _module.check = false;
            }
          )
        ];
      };
    in
    pkgs.nixosOptionsDoc {
      inherit (eval) options;
    };
}
