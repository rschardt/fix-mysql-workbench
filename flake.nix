{
  description = "Flake for someone using mysql-workbench";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-21.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [pkgs.mysql-workbench];
      };
  });
}
