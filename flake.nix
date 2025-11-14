{
  description = "Cato VPN client Nix package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    packages.${system} = {
      cato = pkgs.callPackage ./cato.nix {};
      cato-clientd = pkgs.writeShellScriptBin "cato-clientd" ''
        exec ${self.packages.${system}.cato}/bin/cato-clientd "$@"
      '';
      cato-sdp = pkgs.writeShellScriptBin "cato-sdp" ''
        exec ${self.packages.${system}.cato}/bin/cato-sdp "$@"
      '';
      default = self.packages.${system}.cato;
    };

    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        (callPackage ./cato.nix {})
      ];
    };
  };
}