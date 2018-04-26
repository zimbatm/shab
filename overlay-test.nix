# Tests the overlay
let
  pkgs = import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; };
  shabExample = pkgs.runShab "example" { hello = 123; } (pkgs.writeText "tpl" ''
    foo $hello bar
  '');
in pkgs.runCommand "test" {
     actual = shabExample;
     expected = pkgs.writeText "expected" "foo 123 bar\n\n";
   } ''
     diff $actual $expected
     :>$out
   ''
