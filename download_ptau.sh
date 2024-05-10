#!/bin/bash

mkdir -p ptau
cd ptau

base_url="https://storage.googleapis.com/zkevm/ptau"

files=(
  # "powersOfTau28_hez_final_13.ptau"
  # "powersOfTau28_hez_final_14.ptau"
  # "powersOfTau28_hez_final_15.ptau"
  # "powersOfTau28_hez_final_16.ptau"
  # "powersOfTau28_hez_final_17.ptau"
  # "powersOfTau28_hez_final_21.ptau"
  "powersOfTau28_hez_final_23.ptau"
)

for file in "${files[@]}"
do
  echo "Downloading $file..."
  curl -O "$base_url/$file"
done

echo "All files downloaded."
