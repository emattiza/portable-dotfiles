{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    curl
    starship
    entr
    exercism
    (python311.withPackages (ps: [ps.pytest ps.ipython]))
    sqlacodegen
  ];
}
