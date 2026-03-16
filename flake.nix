{
  description = "OpenShift Helm chart repository with certified charts for Red Hat OpenShift";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ kubernetes-helm kubectl ];
      };
    });
}
