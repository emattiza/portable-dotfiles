{
  description = "my portable dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    my-nvim.url = "github:emattiza/neovim-flake/terafox-tweak";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    my-nvim,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      vim = my-nvim.packages.${system}.default;
    in rec {
      devShells = {
        default = import ./shells/devShell.nix {inherit pkgs vim;};
        k8s = import ./shells/k8s.nix {inherit pkgs;};
        coconut = import ./shells/coconut.nix {inherit pkgs;};
      };
      devShell = devShells.default;
    });
}
