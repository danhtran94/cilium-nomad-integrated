#!/usr/bin/env bash

mkdir nomad
cd nomad
curl -o nomad_0.7.1_linux_amd64.zip https://releases.hashicorp.com/nomad/0.7.1/nomad_0.7.1_linux_amd64.zip
unzip nomad_0.7.1_linux_amd64.zip
mv nomad /usr/local/bin
chmod +x /usr/local/bin/nomad
cd ..
