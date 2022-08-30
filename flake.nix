## The template this flake was based on can be found here:
## https://github.com/johnae/nix-flake-templates/devshell
{
  description = "A simple devshell flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    pkgsFor = system:
      import nixpkgs {
        inherit system;
        overlays = [
        ];
      };
    forAllDefaultSystems = f:
      flake-utils.lib.eachDefaultSystem
      (system: f system (pkgsFor system));
  in
    forAllDefaultSystems (
      system: pkgs: {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.curl
          ];
        };
      }
    );
}
