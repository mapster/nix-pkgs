{ stdenv, fetchFromGitHub, makeWrapper, ourMaintainers, xclip, dmenu }:
let
  runtimePath = stdenv.lib.makeBinPath [ xclip dmenu ];
in
stdenv.mkDerivation rec {
  pname = "yubikey-oath-dmenu";
  version = "0.12.0-rc1";

  src = fetchFromGitHub {
    owner = "emlun";
    repo = "yubikey-oath-dmenu";
    rev = "fbaf6050e82bca4773a5043d4adb71d41bb1a220";
    sha256 = "0rr3hg9q7rbfvb082n1iwrnq7gfbwgac8wf4zf9xfvi24w9sx151";
  };
  
  buildInputs = [ makeWrapper ];

  makeFlags = [ "PREFIX=$(out)" ];
  postInstall = ''
    for bin in $out/bin/*; do
      wrapProgram "$bin" --prefix PATH : "${runtimePath}"
    done
  '';

  meta = {
    description = "Yubikey OATH using dmenu";
    inherit (src.meta) homepage;
    license = stdenv.lib.licenses.gpl3Only;
    maintainers = [ ourMaintainers.mapster ];
  };

}
