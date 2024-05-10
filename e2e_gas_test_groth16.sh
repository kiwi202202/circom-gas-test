#!/bin/bash

# PATH VARIABLES
# Below paths are relative to the ./groth16 directory
export CIRCUIT_NAME=multiplier_test_10k
export CIRCUIT_PATH=../../circuits/${CIRCUIT_NAME}.circom
export CIRCUIT_LIB_PATH=../node_modules/circomlib/circuits
export POT_PATH=../../ptau/powersOfTau28_hez_final_21.ptau
export INPUT_PATH=../../../inputs/multiplier_test/input_10k.json
export VERIFIER_SOL_PATH=../../hardhat/contracts/verifier.sol

set -e

cd ./groth16

./groth16_gas_test.sh

cd ../hardhat

npx hardhat test scripts/groth16_gas_test.js
