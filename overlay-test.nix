# Tests the overlay
let
  pkgs = import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; };

  shabExample = pkgs.shab.render (pkgs.writeText "tpl" ''
    foo $hello bar
  '') { hello = 123; } ;

  shabTextExample = pkgs.shab.renderText ''
    foo $hello bar
  '' { hello = 123; } ;

in
{

  test_runShab =
    pkgs.runCommand "test" {
      actual = shabExample;
      expected = pkgs.writeText "expected" "foo 123 bar\n\n";
    } ''
      diff $actual $expected
      :>$out
    '';

  test_runShabText =
    pkgs.runCommand "test" {
      actual = shabTextExample;
      expected = pkgs.writeText "expected" "foo 123 bar\n\n";
    } ''
      diff $actual $expected
      :>$out
    '';

}
