# Nix Flake for Cuis Smalltalk

This flake builds a user FHS environment suitable for running Cuis Smalltalk.

Probably a better packaging would use the existing `opensmalltalk-vm` Nix package.

Please note that the MIT licence is just for the Nix flake.  Cuis itself has its own licence.

## Usage

```
$ git clone https://github.com/Cuis-Smalltalk/Cuis6-2.git
$ cd Cuis6-2
$ nix run github:tesujimath/Cuis-Smalltalk.nix
$ ./RunCuisOnLinux.sh

```
