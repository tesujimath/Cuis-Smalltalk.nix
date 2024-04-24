{
  description = "A flake to run Cuis";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        with pkgs;
        {
          devShells.default = mkShell {
            nativeBuildInputs = [
              bashInteractive
            ];
            shellHook = let lib-pkgs = [
              libGL
              libpulseaudio
              libuuid.lib
              xorg.libICE
              xorg.libSM
              xorg.libX11
              xorg.libXext
              xorg.libXrender
            ]; in ''
              export NIX_LD="${glibc}/lib64/ld-linux-x86-64.so.2"
              export NIX_LD_LIBRARY_PATH="${lib.strings.concatMapStringsSep ":" (p: p + "/lib") lib-pkgs}"
            '';
          };
        }
      );
}
