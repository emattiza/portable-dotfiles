{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    curl
    starship
    (python311.withPackages (ps: [ps.pytest ps.ipython]))
  ];
}
