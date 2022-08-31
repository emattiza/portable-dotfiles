{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    coconut
    python310
  ];
  shellHook = "source <(${pkgs.starship}/bin/starship init bash --print-full-init)\n";
}
