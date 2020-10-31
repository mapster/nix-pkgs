{ stdenv, fetchFromGitHub, ourMaintainers, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "flux";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "flux2";
    rev = "v0.2.1";
    sha256 = "0wfndpca91m9s3j79zb1rd4dqhy964paqlbryi4lwj10lxy71qlh";
  };
  
  vendorSha256 = "1vvy2cblwjrxhxkbkhr8ry70nxi525zks7avjji3vph0r5fbivzx";
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
