#!/bin/bash
if [ -z "$1" ] && [ -z "$2" ]; then
    echo "Use build_docker.sh parity_version rust_version"
else
case $1 in
stable|beta|nightly)
git clone -b $1 https://github.com/paritytech/parity.git
;;
*)
    echo "Parity should be stable, beta or master"
;;
esac
case $2 in
stable|beta|nightly)
cp Dockerfile parity/
cd parity
docker build --build-arg rust_version=$2 --tag parity:$2 .
mkdir artefact
docker run --rm --entrypoint /bin/cat  parity:latest parity/target/release/parity > artefact/parity
;;
*)
echo "Rust should be stable, beta or nightly"
;;
esac    
fi

