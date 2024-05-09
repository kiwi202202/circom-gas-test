#!/bin/bash

# PATH VARIABLES
# Below paths are relative to the ./groth16 directory
export CIRCUIT_NAME=sha256_test_out_64
export CIRCUIT_PATH=../../circuits/${CIRCUIT_NAME}.circom
export CIRCUIT_LIB_PATH=../node_modules/circomlib/circuits
export POT_PATH=../../ptau/powersOfTau28_hez_final_21.ptau
export INPUT_PATH=../../../inputs/sha256_test/input_64.json 
export VERIFIER_SOL_PATH=../../hardhat/contracts/verifier.sol

cd ./groth16

./groth16_gas_test.sh

cd ../hardhat

npx hardhat test scripts/circuit_gas_test.js
