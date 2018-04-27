self: super: {

  shab = super.callPackage ./shab.nix {};

  runShab = name: shabScript: parameters:
    let extraParams = {
          inherit shabScript;
        };
    in super.runCommand name (parameters // extraParams) ''
      ${self.shab}/bin/shab "$shabScript" >$out
    '';

}
