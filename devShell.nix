{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [curl starship];
  shellHook = "  source <(${pkgs.starship}/bin/starship init bash --print-full-init)\n";
}
