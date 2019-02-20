{ bash, stdenv, lib, runCommand, writeText, ... }:
let
  shab = stdenv.mkDerivation {
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

    passthru = {
      inherit render renderText;
    };
  };

  /*
     shabScript:       a path or filename to use as a template
     parameters.name:  the name to use as part of the store path
     parameters:       variables to expose to the template
   */
  render = shabScript: parameters:
    let extraParams = {
          inherit shabScript;
        };
    in runCommand "out" (parameters // extraParams) ''
      ${shab}/bin/shab "$shabScript" >$out
    '';

  /*
     shabScriptText:   a string to use as a template
     parameters.name:  the name to use as part of the store path
     parameters:       variables to expose to the template
   */
  renderText = shabScriptText: parameters:
    render (writeText "template" shabScriptText) parameters;

in
  shab
