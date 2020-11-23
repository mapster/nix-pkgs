{ stdenv, fetchFromGitHub, ourMaintainers, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "flux";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "flux2";
    rev = "v0.3.0";
    sha256 = "0hcxcfbkiaq06g0z5fkp0g91xl37gj5hf7ccn34zz62vij62cl5n";
  };
  
  vendorSha256 = "13x3bdb5nj2nii9gdr0kkp74xfg8papmlm5621y4j4nn1jkjkcaf";
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
