{
  description = "my portable dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      devShells = {
        default = import ./shells/devShell.nix {inherit pkgs;};
        k8s = import ./shells/k8s.nix {inherit pkgs;};
        coconut = import ./shells/coconut.nix {inherit pkgs;};
      };
      devShell = devShells.default;
    });
}
