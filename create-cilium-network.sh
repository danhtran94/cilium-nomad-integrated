#!/usr/bin/env bash

docker network create --ipv6 --subnet ::1/112 --driver cilium --ipam-driver cilium cilium-net
