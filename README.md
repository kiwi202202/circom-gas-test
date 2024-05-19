---

# Circom Gas Test Tool

Welcome to the Circom Gas Test Tool, a practical repository created for developers interested in quickly testing the gas costs of snarkjs verifiers and experimenting with circuit optimization using SHA256 hashing. 

## Features

### Gas Cost Testing Framework
This framework provides an easy and efficient way to test gas costs associated with snarkjs verifiers. The testing process consists of three main steps:

1. **Write the Circom File**: Create a `.circom` file within the `circuits` directory to define your circuit.
2. **Set Up Input**: Add a corresponding `input.json` file in the `inputs` directory to feed data into your circuit.
3. **Modify and Run Tests**: Update the `CIRCUIT_NAME` and `INPUT_PATH` in the `e2e` script to match your new circuit and input. Optionally, you can add a new `powerOfTau` file if required.

Run the test with the updated script settings, and analyze the gas consumption of your circuit.

### SHA256 PubSignal Compression Tool
Inspired by the techniques used in [pil-stark](https://github.com/0xPolygonHermez/pil-stark/blob/main/circuits.bn128/stark_verifier.circom.ejs), this tool extracts and refactors the code necessary to compress public signals (pubSignals) using SHA256. This method is encapsulated in the `pub_wrapper.circom.ejs` located in the `wrapper` directory of this repository.

This wrapper circuit ensures that inputs remain consistent with the original circuit, while the outputs are hashed using SHA256. This approach helps in reducing the gas costs by minimizing the number of public inputs needed when verifying a proof on the Ethereum.

Additionally, the sample.py script is provided to demonstrate how smart contracts should interact with the public signals from the wrapped circuit. For more detailed examples and best practices, you can also refer to this [Notion Page](https://cheddar-string-d28.notion.site/Maximizing-Efficiency-in-Ethereum-ZKPs-Comparing-Groth16-and-FFLONK-Gas-Costs-and-Implementing-Best-ea6d32f73e9e428790417186db4177d5). 
## Getting Started
To get started with testing or utilizing the SHA256 compression tool, follow the steps outlined in the [Installation](#installation) section below.


### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/kiwi202202/circom-gas-test
   cd circom-gas-test
   ```

2. **Install Dependencies**
   ```bash
   npm install
   cd hardhat
   npm install
   cd ..
   ```

3. **Set Up the Powers of Tau**:
   Create a directory for the powers of Tau and download the files needed.
   ```bash
   mkdir ptau
   # Download your desired powersOfTau files into the ptau directory
   ```

4. **Dependencies**:
   The project relies on several external tools and libraries:
   - [Circom](https://github.com/iden3/circom): For circuit compilation.
   - [SnarkJS](https://github.com/iden3/snarkjs): For zk-SNARK proof generation and verification.
   - Hardhat: For Ethereum development tasks.

### Running Tests
To run the end-to-end gas test script:
```bash
./e2e_gas_test_groth16.sh
```

Follow these steps to set up and start using the framework for testing and circuit optimization.



