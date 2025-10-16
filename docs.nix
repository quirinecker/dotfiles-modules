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

      replaceNixPathWithRelative =
        p:
        let
          match = builtins.match "^/nix/store/[^/]+/(.*)$" p;
        in
        if match != null then
          "https://gitlab.com/quirinecker/dotfiles-modules/" + builtins.elemAt match 0
        else
          p;

      transformOptions =
        o:
        let
          declarations = o.declarations;
          mappedDeclarations = builtins.map (d: replaceNixPathWithRelative d) declarations;
        in
        o // { declarations = mappedDeclarations; };
    in
    pkgs.nixosOptionsDoc {
      options = eval.options;
      transformOptions = o: transformOptions o;
    };
}
