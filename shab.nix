{ bash, stdenv, lib, ... }:

stdenv.mkDerivation {
  name = "shab";
  src = lib.sourceByRegex ./. ["^shab$" "^test.*"];
  postPatch = ''
    for f in test.sh test/*.sh; do
      patchShebangs "$f"
    done
  '';
  buildPhase = "";
  doCheck = true;
  checkPhase = ''
    ./test.sh
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp ./shab $out/bin/shab
  '';
  doInstallCheck = true;
  installCheckPhase = ''
    [[ "$(echo 'Hello $entity' | entity=world $out/bin/shab)" == 'Hello world' ]]
  '';
}
