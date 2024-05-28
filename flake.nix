{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
    neorg.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
  };

  outputs = inputs@{ nixpkgs, nixvim, utils, neorg, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        lib = import ./lib.nix {
          inherit inputs system;
        };
        # Needed to make neorg work after upgrade to 8.0.0 https://github.com/nix-community/nixvim/issues/1395
        overlays = [ neorg.overlays.default ];
        pkgs = import nixpkgs { inherit system overlays; };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = { inherit inputs lib; };
        };
      in {
        checks.default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim lib;
          name = "Personal Neovim configuration";
        };
        packages.default = nvim;
        formatter = pkgs.nixfmt;
      });
}
