#!/bin/bash

# PATH VARIABLES
# Below paths are relative to the ./groth16 directory
export CIRCUIT_NAME=output_circuit
export CIRCUIT_PATH=../../circuits/${CIRCUIT_NAME}.circom
export CIRCUIT_LIB_PATH_1=../node_modules/circomlib/circuits
export CIRCUIT_LIB_PATH_2=../circuits
export POT_PATH=../../ptau/powersOfTau28_hez_final_16.ptau
export INPUT_PATH=../../../inputs/internal_circuit/input.json
export VERIFIER_SOL_PATH=../../hardhat/contracts/verifier.sol

set -e

cd ./groth16

./groth16_gas_test.sh

cd ../hardhat

npx hardhat test scripts/groth16_gas_test.js
