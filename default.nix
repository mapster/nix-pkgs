let
  pkgs = import <nixpkgs> {};
in
import ./all-packages.nix { inherit pkgs; }
