#!/bin/bash -e

RKT_VERSION='1.25.0'
ACBUILD_VERSION='0.4.0'

# rkt
printf '\n\n[install] rkt\n\n'
outdir="/tmp/rkt"
outfile="${outdir}/rkt_${RKT_VERSION}-1_amd64.deb"

mkdir -p "$outdir"

if [ ! -e "$outfile" ]; then
  wget -P "$outdir" https://github.com/rkt/rkt/releases/download/v${RKT_VERSION}/rkt_${RKT_VERSION}-1_amd64.deb
  wget -P "$outdir" https://github.com/rkt/rkt/releases/download/v${RKT_VERSION}/rkt_${RKT_VERSION}-1_amd64.deb.asc
fi

gpg --recv-key 18AD5014C99EF7E3BA5F6CE950BDD3E0FC8A365E
gpg --verify "${outfile}.asc"
sudo dpkg -i "$outfile"

# acbuild
printf '\n\n[install] acbuild\n\n'
outdir="/tmp/acbuild"
outfile="${outdir}/acbuild-v${ACBUILD_VERSION}.tar.gz"

mkdir -p "$outdir"

if [ ! -e "$outfile" ]; then
  wget -P "$outdir" https://github.com/containers/build/releases/download/v${ACBUILD_VERSION}/acbuild-v${ACBUILD_VERSION}.tar.gz
  wget -P "$outdir" https://github.com/containers/build/releases/download/v${ACBUILD_VERSION}/acbuild-v${ACBUILD_VERSION}.tar.gz.asc
fi

tar -xzf "$outfile" -C "$outdir"
cp -R "${outdir}/acbuild-v${ACBUILD_VERSION}/acbuild" "/usr/bin/"
