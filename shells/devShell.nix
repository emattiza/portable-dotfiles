{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [curl httpie starship];
  shellHook = "source <(${pkgs.starship}/bin/starship init bash --print-full-init)\n";
}
