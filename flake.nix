{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        calibre = pkgs.callPackage ./calibre.nix {};
      in {
        defaultPackage = calibre;
        devShell = pkgs.mkShell {
          buildInputs = [ calibre ];
        };
      });
}

