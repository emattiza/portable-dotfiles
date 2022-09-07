{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    awscli2
    curl
    httpie
    kind
    k9s
    kubernetes-helm
    kubectl
    kubectx
    rancher
    subversion
    starship
    terraform
    terraform-lsp
    talosctl
    dhall
    dhall-json
    dhall-lsp-server
  ];
  shellHook = ''
    if [[ ! $HOST_PATH == *"starship"* ]];
    then
       eval <(starship init bash --print-full-init)
    fi
  '';
}
