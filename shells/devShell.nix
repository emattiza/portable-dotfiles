{
  pkgs,
  vim,
  ...
}: let
  update-check = import ../outdated-util {inherit pkgs;};
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      curl
      update-check
      httpie
      starship
      vim
      ranger
    ];
    shellHook = ''
      if [[ ! $HOST_PATH == *"starship"* ]];
      then
         source <(starship init bash --print-full-init)
      fi
    '';
  }
