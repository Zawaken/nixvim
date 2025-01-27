{
  description = "Personal Nvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
    # neorg.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixvim, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        utils = import ./utils.nix {
          inherit inputs system;
          lib = inputs.nixpkgs.lib;
        };
        # Needed to make neorg work after upgrade to 8.0.0 https://github.com/nix-community/nixvim/issues/1395
        # overlays = [ neorg.overlays.default ];
        overlays = [ ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = { inherit inputs utils; };
        };
      in {
        checks.default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim utils;
          name = "Personal Neovim configuration";
        };
        packages.default = nvim;
        formatter = pkgs.nixfmt;
      });
}
