#!/bin/bash

# Build the smart contracts
cd contracts/build
cmake ..
make

# Run Hydra tests
cd ../..
npm test
