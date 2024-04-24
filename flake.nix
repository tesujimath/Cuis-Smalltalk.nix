{
  description = "A flake to run Cuis";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
            cuis_env = pkgs.buildFHSUserEnv {
              name = "cuis-env";
              targetPkgs = pkgs: (with pkgs;
                [
                  libGL
                  libpulseaudio
                  libuuid.lib
                ]) ++ (with pkgs.xorg;
                  [
                    libICE
                    libSM
                    libX11
                    libXext
                    libXrender
                  ]);
              runScript = "bash";
            };
        in
        with pkgs;
        {
          packages.default = cuis_env;
        }
      );
}
