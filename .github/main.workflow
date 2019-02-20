workflow "Build and test" {
  on = "push"
  resolves = [
    "Run tests",
    "Nix build",
    "Nix overlay",
  ]
}

action "Nix build" {
  uses = "docker://nixpkgs/nix:latest"
  runs = "nix-build"
  args = ["--option", "sandbox", "false"]
}

action "Nix overlay" {
  uses = "docker://nixpkgs/nix:latest"
  runs = "nix-build"
  args = ["overlay-test.nix", "--option", "sandbox", "false"]
}

action "Run tests" {
  uses = "docker://nixpkgs/nix:latest"
  runs = "./test.sh"
}
