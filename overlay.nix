self: super: {

  shab = super.callPackage ./shab.nix {};

  runShab = name: parameters: shabScript:
    let extraParams = {
          inherit shabScript;
        };
    in super.runCommand name (parameters // extraParams) ''
      ${self.shab}/bin/shab "$shabScript" >$out
    '';

}
