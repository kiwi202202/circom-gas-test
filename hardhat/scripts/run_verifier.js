const { ethers } = require("hardhat");
const fs = require("fs");
const snarkjs = require("snarkjs");

async function main() {
  // convert groth16 proof (generated by the sh script in groth16) to calldata onchain
  const proof = JSON.parse(
    fs.readFileSync("../groth16/build/proof.json", "utf8")
  );
  const publicSignals = JSON.parse(
    fs.readFileSync("../groth16/build/public.json", "utf8")
  );
  // first, verify the proof using node
  const vKey = JSON.parse(
    fs.readFileSync("../groth16/build/verification_key.json")
  );

  const res = await snarkjs.groth16.verify(vKey, publicSignals, proof);

  if (res === true) {
    console.log("Pre-Verification OK");
  } else {
    console.log("Invalid proof");
  }

  const calldata = await snarkjs.groth16.exportSolidityCallData(
    proof,
    publicSignals
  );
  let jsonCalldata = JSON.parse("[" + calldata + "]");
  console.log("publicSignals: ");
  console.log(publicSignals);

  // const verifierABI = JSON.parse(fs.readFileSync('path_to_ABI.json', 'utf8'));
  const verifierAddress = "0x4bc328BA0D8d70D7881A41033aA007cDA7CDca71";
  const verifier = await ethers.getContractAt(
    "contracts/verifier.sol:Groth16Verifier",
    verifierAddress
  );
  // const verifier =
  // finally, we estimate the gas consumption using the generated proof and the generated verifier.sol
  async function try_estimateGas() {
    try {
      const verifyResult = await verifier.verifyProof(
        jsonCalldata[0],
        jsonCalldata[1],
        jsonCalldata[2],
        jsonCalldata[3]
      );
      console.log(verifyResult);
      // console.log(`Gas Consumption: ${result.gas.toString()}`);
    } catch (error) {
      console.error(`Error estimating gas: ${error}`);
    }
  }

  await try_estimateGas();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
