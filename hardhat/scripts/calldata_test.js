const snarkjs = require("snarkjs");
const fs = require("fs");

async function run() {
  // const { proof, publicSignals } = await snarkjs.groth16.fullProve(
  //   { a: 3, b: 11 },
  //   "../../groth16/build/circuit_js/circuit.wasm",
  //   "../../groth16/build/circuit_final.zkey"
  // );

  const proof = JSON.parse(
    fs.readFileSync("../../groth16/build/proof.json", "utf8")
  );
  const publicSignals = JSON.parse(
    fs.readFileSync("../../groth16/build/public.json", "utf8")
  );
  console.log("Proof: ");
  console.log(JSON.stringify(proof, null, 1));

  const vKey = JSON.parse(
    fs.readFileSync("../../groth16/build/verification_key.json")
  );

  const res = await snarkjs.groth16.verify(vKey, publicSignals, proof);

  if (res === true) {
    console.log("Verification OK");
  } else {
    console.log("Invalid proof");
  }

  const calldata = await snarkjs.groth16.exportSolidityCallData(
    proof,
    publicSignals
  );
  //   console.log(calldata);
  let jsonCalldata = JSON.parse("[" + calldata + "]");
  console.log(jsonCalldata);
}

run().then(() => {
  process.exit(0);
});
