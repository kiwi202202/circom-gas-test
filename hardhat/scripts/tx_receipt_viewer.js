const { ethers } = require("hardhat");

async function main() {
  const txHash =
    "0x119fe219a4899ea6cf13b96335336c175609ba21c1bafc79bf8c3d8c8bc0ec56"; // Replace with your actual transaction hash

  // Assuming you are connected to the Sepolia network through Hardhat's network configuration
  const transactionReceipt = await ethers.provider.getTransactionReceipt(
    txHash
  );

  if (transactionReceipt) {
    console.log("Transaction Receipt:", transactionReceipt);
  } else {
    console.log("No receipt found for transaction hash:", txHash);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
