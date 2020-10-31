let
  pkgs = import <nixpkgs> {};
  ourMaintainers = import ./maintainers.nix;
in
import ./all-packages.nix { inherit pkgs ourMaintainers; }
