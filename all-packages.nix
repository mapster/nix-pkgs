{ pkgs, ourMaintainers }:
rec {
  flux2 = callPackage ./flux2 { inherit ourMaintainers; };
  yubikey-oath-dmenu = callPackage ./yubikey-oath-dmenu { inherit ourMaintainers; };
  
  callPackage = pkgs.callPackage;
}
