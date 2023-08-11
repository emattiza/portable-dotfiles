{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    neovimEM
    git
    hub
    gh
    nixpkgs-update
    nixpkgs-review
    nix-output-monitor
    ranger
  ];
}
