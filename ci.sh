#!/bin/bash

# Build automation script for C++ project
# Works on Linux/macOS and Windows (with Git Bash/WSL)

set -e  # Exit on any error

echo "Starting build process..."

# Clean and create build directory
if [ -d "build" ]; then
    echo "Removing existing build directory..."
    rm -rf build
fi

echo "Creating fresh build directory..."
mkdir build

# Change to build directory
echo "Changing to build directory..."
cd build

# Configure the project using CMake
echo "Configuring project with CMake..."
cmake ..

# Build the project
echo "Building the project..."
cmake --build .

# Run tests using CTest
echo "Running tests..."
ctest --output-on-failure

echo "Build and test process completed successfully!"
echo "Executable 'hello' should be available in the build directory."