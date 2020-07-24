#!/bin/bash

# Build the smart contracts
mkdir contracts/build
cd contracts/build
cmake ..
make

# Run Hydra tests
cd ../..
npm test
