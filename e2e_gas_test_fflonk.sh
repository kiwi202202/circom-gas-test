#!/bin/bash

# PATH VARIABLES
# Below paths are relative to the ./groth16 directory
export CIRCUIT_NAME=sha256_test_out_64
export CIRCUIT_PATH=../../circuits/${CIRCUIT_NAME}.circom
export CIRCUIT_LIB_PATH=../node_modules/circomlib/circuits
export POT_PATH=../../ptau/powersOfTau28_hez_final_21.ptau
export INPUT_PATH=../../../inputs/sha256_test/input_64.json
export VERIFIER_SOL_PATH=../../hardhat/contracts/verifier.sol

set -e

cd ./fflonk

./fflonk_gas_test.sh

echo ""
echo "=================================================="
echo "TESTING CIRCUIT: ${CIRCUIT_NAME}"
echo "USING INPUT: ${INPUT_PATH}"
echo "=================================================="
echo ""

cd ../hardhat

npx hardhat test scripts/fflonk_gas_test.js
