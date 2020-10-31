{ pkgs, ourMaintainers }:
rec {
  flux = callPackage ./flux { inherit ourMaintainers; };
  yubikey-oath-dmenu = callPackage ./yubikey-oath-dmenu { inherit ourMaintainers; };
  
  callPackage = pkgs.callPackage;
}
