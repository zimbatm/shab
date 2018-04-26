{ pkgs ? import <nixpkgs> {}, ... }:
pkgs.callPackage ./shab.nix {}
