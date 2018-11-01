with import (
  fetchTarball https://github.com/NixOS/nixpkgs/archive/18.09.tar.gz
) {};

stdenv.mkDerivation rec {
  name = "fsharp-environment";

  buildInputs = [
    dotnet-sdk
  ];

  shellHook = ''
    dotnet --version
  '';
}
