#!/bin/bash

# Build the smart contracts
echo 'Building contracts ...'
mkdir contracts/build
cd contracts/build
cmake ..
make

# Run Hydra tests
echo 'Testing contracts ...'
cd ../..
npm test
