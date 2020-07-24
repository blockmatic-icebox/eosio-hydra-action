#!/bin/bash

# Build the smart contracts
echo 'Building contracts ...'
mkdir contracts/build
cd contracts/build
cmake ..
make

# Install node dependencies
echo 'Installing dependencies contracts ...'
npm install

# Run Hydra tests
echo 'Testing contracts ...'
cd ../..
npm test
