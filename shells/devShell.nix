{pkgs, vim, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [curl httpie starship vim ranger];
  shellHook = ''
    if [[ ! $HOST_PATH == *"starship"* ]];
    then
       source <(starship init bash --print-full-init)
    fi
  '';
}
