{
  description = "Personal Nvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
    nixlib = {
      url = "github:runarsf/nixlib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neorg.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixvim, nixlib, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = (f: import f {inherit inputs;}) (lib.concatPaths {paths = ./overlays;});
        };
        lib'' = nixpkgs.lib.extend (_: _: {inherit utils;});
        lib' = lib''.extend nixvim.lib.overlay;
        lib = nixlib.lib.deepMerge [
          lib'
          nixlib.lib
        ];
        utils = import ./utils {
          inherit inputs system pkgs lib;
        };
        config = {
          inherit pkgs;

          module = {
            imports = lib.concatPaths {
              paths = [
                ./config
                ./modules
              ];
              filterDefault = false;
              exclude = [
                ./modules/dashboard/quotes.nix
              ];
            };
          };
          extraSpecialArgs = {
            inherit inputs lib;
          };
        };
      in {
        checks = {
          default = nixvim.lib.check.mkTestDerivationFromNvim config;
        };
        packages = rec {
          default = nixvim.legacyPackages.${system}.makeNixvimWithModule config;
          nvim = default;

          updater = pkgs.writeShellScriptBin "nixvim-flake-updater" ''
            printf '\033[1;34minfo:\033[0m updating fetchers...\n'
            ${nixpkgs.lib.getExe pkgs.update-nix-fetchgit} --verbose ./**/*.nix 2>&1 | grep --line-buffered -i "updating"
            printf '\033[1;34minfo:\033[0m updating flake inputs...\n'
            nix flake update
          '';
        };
        formatter = pkgs.nixfmt;
      });
}
