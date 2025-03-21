{ lib, stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  pname = "LKH";
  version = "3.0.10"; # Change this to the latest version

  src = fetchurl {
    url = "http://webhotel4.ruc.dk/~keld/research/LKH/LKH-${version}.tar.gz";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with correct hash
  };

  nativeBuildInputs = [ unzip ];
  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp LKH $out/bin/
  '';

  meta = with lib; {
    description = "The Traveling Salesman Problem solver LKH";
    homepage = "http://webhotel4.ruc.dk/~keld/research/LKH/";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
