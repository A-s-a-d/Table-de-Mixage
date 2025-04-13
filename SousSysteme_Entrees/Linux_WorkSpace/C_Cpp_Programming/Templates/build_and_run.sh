#!/bin/bash
set -e

echo "BUILD and RUN"

echo "BUILDING..."
./build.sh

echo "RUNNING..."
cd build

# Ensure binary exists
if [ ! -f ./CLK_11_265_000Hz ]; then
    echo "Error: Binary not found!"
    exit 1
fi

# Run binary with sudo (if needed)
sudo ./CLK_11_265_000Hz
