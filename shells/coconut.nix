{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    coconut
    python310
  ];
  shellHook = ''
    if [[ ! $HOST_PATH == *"starship"* ]];
    then
       eval <(starship init bash --print-full-init)
    fi
  '';
}
