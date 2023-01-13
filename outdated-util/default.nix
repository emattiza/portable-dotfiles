{pkgs, ...}: let
  file = builtins.readFile ./script.py;
in
  pkgs.writers.writePython3Bin "update-check" {
    libraries = with pkgs.python311Packages; [];
  }
  file
