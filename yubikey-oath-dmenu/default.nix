{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation {
  pname = "yubikey-oath-dmenu";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "emlun";
    repo = "yubikey-oath-dmenu";
    rev = "v0.11.0";
    sha256 = "0mpapmz7arn8wja29zsm7pfj4san805g1zfw3bwkg69lnx7lgiwg";
  };

  installPhase = ''
    mkdir -p $out/bin
    echo "out: $out"
    PREFIX="" DESTDIR=$out make install -e
  '';

}
