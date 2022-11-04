{pkgs, vim, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [curl httpie starship vim];
  shellHook = ''
    if [[ ! $HOST_PATH == *"starship"* ]];
    then
       eval <(starship init bash --print-full-init)
    fi
  '';
}
