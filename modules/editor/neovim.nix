{
  inputs,
  ...
}:
let
  rlang =
    pkgs:
    pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        languageserver
        box
        xtable
        dplyr
        svSweave
        knitr
      ];
    };
  runtimeDependencies = pkgs: [
    pkgs.cargo
    pkgs.rustc
    pkgs.nodejs
    pkgs.yarn
    pkgs.unzip
    pkgs.ripgrep
    pkgs.fd
    pkgs.luajitPackages.lua-lsp
    pkgs.lua-language-server
    pkgs.nil
    pkgs.nixfmt
    pkgs.nixd
    pkgs.rust-analyzer
    pkgs.rustfmt
    pkgs.typescript-language-server
    pkgs.vue-language-server
    pkgs.vtsls
    pkgs.deno
    pkgs.vscode-langservers-extracted
    pkgs.yaml-language-server
    (rlang pkgs)
    pkgs.jdt-language-server
    pkgs.tailwindcss-language-server
    pkgs.pyright
    pkgs.protols
    pkgs.clang-tools
    pkgs.taplo
    pkgs.tinymist
    pkgs.dart
    pkgs.tree-sitter
  ];
in
{
  flake.modules.homeManager.neovim =
    {
      pkgs,
      config,
      ...
    }:
    {
      home.sessionVariables = {
        RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      };

      programs.neovim.enable = true;
      programs.zathura.enable = true;
      home.packages = runtimeDependencies pkgs;
      xdg.configFile = {
        "nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./neovim/init.lua;
        "nvim/lua".source = config.lib.file.mkOutOfStoreSymlink ./neovim/lua;
        "nvim/ftplugin".source = config.lib.file.mkOutOfStoreSymlink ./neovim/ftplugin;
        "nvim/projects".source = config.lib.file.mkOutOfStoreSymlink ./neovim/projects;
      };

      # Todo: fix vue language server
      # home.activation.npm-install = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      #   nix-shell -p nodejs --run "cd ${configHome}/.npm_global && npm install"
      # '';
    };

  perSystem = { pkgs, self', ... }: {
    packages.neovim-config = pkgs.stdenv.mkDerivation {
      pname = "neovim-config";
      version = "1.0";
      src = ./neovim;

      installPhase = ''
        mkdir -p $out/nvim
        cp -r lua init.lua $out/nvim
      '';
    };
    packages.neovim = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.neovim;
      runtimeInputs = runtimeDependencies pkgs;
      env = {
        XDG_CONFIG_HOME = "${self'.packages.neovim-config}";
      };
    };

    packages.neovim-slim = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.neovim;
      runtimeInputs = [ ];
      env = {
        XDG_CONFIG_HOME = "${self'.packages.neovim-config}";
      };
    };
  };
}
