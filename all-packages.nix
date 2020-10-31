{ pkgs, ourMaintainers }:
rec {
  yubikey-oath-dmenu = callPackage ./yubikey-oath-dmenu { inherit ourMaintainers; };
  
  callPackage = pkgs.callPackage;
}
