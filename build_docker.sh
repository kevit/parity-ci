#!/bin/bash
git clone https://github.com/paritytech/parity.git
cp Dockerfile parity/
cd parity
docker build --tag parity:latest .
mkdir artefact
docker run --rm --entrypoint /bin/cat  parity:latest parity/target/release/parity > artefact/parity
