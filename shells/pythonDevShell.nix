{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    curl
    httpie
    starship
    ranger
    (python311.withPackages (ps: [ps.pytest ps.ipython]))
  ];
}
