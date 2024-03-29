{
  description = "my portable dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    my-nvim.url = "github:emattiza/neovim-flake/main";
    nixpkgs-update = {
      url = "github:ryantm/nixpkgs-update/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-review = {
      url = "github:Mic92/nixpkgs-review/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    my-nvim,
    nixpkgs-review,
    nixpkgs-update,
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      # git-overlay = import ./overlays/git.nix;
      overlays = [
        my-nvim.overlays.${system}.default
        (import ./overlays/sqlacodegen.nix)
        (self: super:
          {
            nixpkgs-review = nixpkgs-review.packages.${system}.default;
          }
          // (
            if system == "x86_64-linux"
            then {
              nixpkgs-update = nixpkgs-update.packages.${system};
            }
            else {}
          ))
      ];
      pkgs = import nixpkgs {
        inherit system overlays;
        config = {allowUnfree = true;};
      };
    in {
      devShells = {
        default = import ./shells/devShell.nix {inherit pkgs;};
        python = import ./shells/pythonDevShell.nix {inherit pkgs;};
        k8s = import ./shells/k8s.nix {inherit pkgs;};
        coconut = import ./shells/coconut.nix {inherit pkgs;};
        nixpkgs-dev = import ./shells/nixpkgs-dev.nix {inherit pkgs;};
      };
      packages = {
        git = pkgs.git;
      };
    });
}
