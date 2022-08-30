{
  description = "my portable dotfiles";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              curl
              starship
            ];
            shellHook = ''
              source <(${pkgs.starship}/bin/starship init bash --print-full-init)
            '';
          };
        }
      );
}
