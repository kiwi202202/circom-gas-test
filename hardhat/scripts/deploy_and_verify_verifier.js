const { ethers } = require("hardhat");
const fs = require("fs");
const snarkjs = require("snarkjs");

async function main() {
  // Deploy the verifier contract from Groth16Verifier
  const Verifier = await ethers.getContractFactory(
    "contracts/verifier.sol:Groth16Verifier"
  );
  const verifier = await Verifier.deploy();
  const deployed_verifier = await verifier.waitForDeployment();
  const verifier_addr = await deployed_verifier.getAddress();
  console.log("verifier.sol is deployed to:", verifier_addr);

  // Read proof and public signals from files
  const proof = JSON.parse(
    fs.readFileSync("../groth16/build/proof.json", "utf8")
  );
  const publicSignals = JSON.parse(
    fs.readFileSync("../groth16/build/public.json", "utf8")
  );

  // Verify the proof using node.js
  const vKey = JSON.parse(
    fs.readFileSync("../groth16/build/verification_key.json", "utf8")
  );
  const res = await snarkjs.groth16.verify(vKey, publicSignals, proof);

  if (res === true) {
    console.log("Pre-Verification OK");
  } else {
    console.log("Invalid proof");
  }

  // Convert groth16 proof to Solidity calldata
  const calldata = await snarkjs.groth16.exportSolidityCallData(
    proof,
    publicSignals
  );
  const jsonCalldata = JSON.parse("[" + calldata + "]");

  console.log("publicSignals:");
  console.log(publicSignals);

  try {
    const gas_consumption = await verifier.verifyProof(
      jsonCalldata[0],
      jsonCalldata[1],
      jsonCalldata[2],
      jsonCalldata[3]
    );
    console.log(`Gas Consumption: ${gas_consumption.toString()}`);
  } catch (error) {
    console.error(`Error estimating gas: ${error}`);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
