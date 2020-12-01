{ stdenv, fetchFromGitHub, ourMaintainers, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "flux2";
  version = "0.4.2";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "flux2";
    rev = "v0.4.2";
    sha256 = "14ni05sgw54fi4rgcy6ik5fqs9zg2bc73zkgmdmg5m54wc7mqbyd";
  };
  
  vendorSha256 = "15r4lwfq8x8ayw3fa2pjbpk251abnz8s341zq7ka3w2grn6j5lxj";
  subPackages = [ "cmd/flux" ];
  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    for shell in bash fish zsh; do
      $out/bin/flux completion $shell > flux.$shell
      installShellCompletion flux.$shell
    done
  '';

  meta = {
    description = "Flux v2 - Command line utility for assembling Kubernetes CD pipelines the GitOps way";
    inherit (src.meta) homepage;
    license = stdenv.lib.licenses.asl20;
    maintainers = [ ourMaintainers.mapster ];
  };

}
