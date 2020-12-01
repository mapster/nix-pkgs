{ stdenv, fetchFromGitHub, ourMaintainers, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "flux";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "flux2";
    rev = "v0.4.1";
    sha256 = "0djb1kwh16am4dvrfz0h8r9sa5r31bb96189lph7vjgqybj783xy";
  };
  
  vendorSha256 = "11s7h0sp1g0p15lwpfklk1i7yv78bigazhj447rmjgpmn9i8930d";
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
