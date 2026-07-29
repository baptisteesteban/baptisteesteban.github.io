{
  description = "Baptiste Esteban personal website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [zola];
        };
      };
    };
}
