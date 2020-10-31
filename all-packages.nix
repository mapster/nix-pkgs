{ pkgs }:
rec {
  yubikey-oath-dmenu = callPackage ./yubikey-oath-dmenu {};
  callPackage = pkgs.callPackage;
}
