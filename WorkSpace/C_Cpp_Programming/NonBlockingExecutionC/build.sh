#!/bin/bash

# Define the build directory
BUILD_DIR="build"

# Remove the previous build directory if it exists
if [ -d "$BUILD_DIR" ]; then
    echo "Removing previous build directory..."
    rm -rf "$BUILD_DIR"
fi

# Run CMake to configure the project
echo "Configuring project with CMake..."
cmake -S . -B "$BUILD_DIR"

# Build the project
echo "Building the project..."
cmake --build "$BUILD_DIR"

echo "Build complete!"

echo "built program stored in /build"
