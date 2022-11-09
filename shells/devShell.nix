{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [curl httpie starship neovimED ranger];
  shellHook = ''
    if [[ ! $HOST_PATH == *"starship"* ]];
    then
       source <(starship init bash --print-full-init)
    fi
  '';
}
