{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    curl
    starship
    entr
    (python311.withPackages (ps: [ps.pytest ps.ipython]))
  ];
}
