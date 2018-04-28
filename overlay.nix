self: super: {

  shab = super.callPackage ./shab.nix {};

  /*
     shabScript:       a path or filename to use as a template
     parameters.name:  the name to use as part of the store path
     parameters:       variables to expose to the template
   */
  runShab = shabScript: parameters:
    let extraParams = {
          inherit shabScript;
        };
    in super.runCommand "out" (parameters // extraParams) ''
      ${self.shab}/bin/shab "$shabScript" >$out
    '';

  /*
     shabScriptText:   a string to use as a template
     parameters.name:  the name to use as part of the store path
     parameters:       variables to expose to the template
   */
  runShabText = shabScriptText: parameters:
    self.runShab (super.writeText "template" shabScriptText) parameters;
}
