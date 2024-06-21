const { ethers } = require("hardhat");

async function main() {
  // the verifier.sol in the dir contracts is generated by the sh script in groth16
  Verifier = await ethers.getContractFactory(
    "contracts/verifier.sol:Groth16Verifier"
  );
  verifier = await Verifier.deploy();
  const deployed_verifier = await verifier.waitForDeployment();
  const verifier_addr = await deployed_verifier.getAddress();
  console.log("verifier.sol is deployed to:", verifier_addr);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });