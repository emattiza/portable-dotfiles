{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    neovimEM
    hub
    nixpkgs-update
    nixpkgs-review
    nix-output-monitor
    ranger
  ];
  shellHook = ''
    if [[ ! $HOST_PATH == *"starship"* ]];
    then
       source <(starship init bash --print-full-init)
    fi
  '';
}
