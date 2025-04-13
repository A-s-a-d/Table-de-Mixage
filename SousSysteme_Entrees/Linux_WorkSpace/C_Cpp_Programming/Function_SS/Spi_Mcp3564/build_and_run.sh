#!/bin/bash
set -e

echo "BUILD and RUN"

echo "BUILDING..."
./build.sh

echo "RUNNING..."
cd build

# Ensure binary exists
if [ ! -f ./Spi_Mcp3564 ]; then
    echo "Error: Binary not found!"
    exit 1
fi

# Run binary with sudo (if needed)
sudo ./Spi_Mcp3564
