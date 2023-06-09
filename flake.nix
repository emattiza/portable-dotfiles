{
  description = "my portable dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    my-nvim.url = "github:emattiza/neovim-flake/main";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    my-nvim,
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      # git-overlay = import ./overlays/git.nix;
      overlays = [my-nvim.overlays.${system}.default];
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
      };
      packages = {
        git = pkgs.git;
      };
    });
}
