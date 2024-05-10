#!/bin/bash

# CIRCUIT_NAME=sha256_test_out_64
# CIRCUIT_PATH=../../circuits/${CIRCUIT_NAME}.circom
# CIRCUIT_LIB_PATH=../node_modules/circomlib/circuits
# POT_PATH=../../ptau/powersOfTau28_hez_final_21.ptau
# # we use input in circuit_js dir
# INPUT_PATH=../../../inputs/sha256_test/input_64.json 
# VERIFIER_SOL_PATH=../../hardhat/contracts/verifier.sol

PROVE_SYSTEM=fflonk

set -e

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

current_dir=$(pwd)

if [ "$script_dir" == "$current_dir" ]; then
    rm -rf build
    mkdir build
    cd build
else
    echo "Warning: Wrong Directory"
    echo "Current Script Directory: $script_dir"
    echo "Current Directory: $current_dir"
    exit 1
fi

echo "Compiling circuit..."
circom ${CIRCUIT_PATH} --r1cs --wasm -l ${CIRCUIT_LIB_PATH}

echo "Generating witness..."
cd ${CIRCUIT_NAME}_js
node generate_witness.js ${CIRCUIT_NAME}.wasm ${INPUT_PATH} ../witness.wtns
cd ..

echo "Performing setup..."
snarkjs ${PROVE_SYSTEM} setup ${CIRCUIT_NAME}.r1cs ${POT_PATH} circuit_final.zkey 

echo "Exporting verification key..."
snarkjs zkey export verificationkey circuit_final.zkey verification_key.json

echo "Generating proof..."
snarkjs ${PROVE_SYSTEM} prove circuit_final.zkey witness.wtns proof.json public.json

echo "Verifying proof..."
snarkjs ${PROVE_SYSTEM} verify verification_key.json public.json proof.json

echo "Export verifier.sol file..."
snarkjs zkey export solidityverifier circuit_final.zkey ${VERIFIER_SOL_PATH}
