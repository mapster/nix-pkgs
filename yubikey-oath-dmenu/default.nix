{ stdenv, fetchFromGitHub, makeWrapper, ourMaintainers, xclip, dmenu }:
let
  runtimePath = stdenv.lib.makeBinPath [ xclip dmenu ];
in
stdenv.mkDerivation {
  pname = "yubikey-oath-dmenu";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "emlun";
    repo = "yubikey-oath-dmenu";
    rev = "v0.11.0";
    sha256 = "0mpapmz7arn8wja29zsm7pfj4san805g1zfw3bwkg69lnx7lgiwg";
  };
  
  buildInputs = [ makeWrapper ];

  makeFlags = [ "PREFIX=$(out)" ];
  postInstall = ''
    for bin in $out/bin/*; do
      wrapProgram "$bin" --prefix PATH : "${runtimePath}"
    done
  '';

  meta = with stdenv.lib; {
    description = "Yubikey OATH using dmenu";
    inherit (src.meta) homepage;
    license = licenses.gpl3Only;
    maintainers = [ ourMaintainers.mapster ];
  };

}
