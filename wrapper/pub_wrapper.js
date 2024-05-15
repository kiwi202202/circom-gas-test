const ejs = require("ejs");
const fs = require("fs");
const path = require("path");

const params = {
  internalInfo: {
    circuitPaths: [
      "../circuits/internal_circuit.circom",
      "../node_modules/circomlib/circuits/sha256/sha256.circom",
      "../node_modules/circomlib/circuits/bitify.circom",
    ],
    circuitName: "InternalCircuit",
    nPublics: 3,
    inputSize: 3,
    publicsBits: [64, 64, 64],
  },
};

const templatePath = path.join(__dirname, "pub_wrapper.circom.ejs");

let template;
try {
  template = fs.readFileSync(templatePath, "utf8");
  console.log("Template loaded successfully.");
} catch (err) {
  console.error("Error reading template file:", err);
  process.exit(1);
}

// console.log(template);

const outputFilePath = path.join(
  __dirname,
  "../circuits/output_circuit.circom"
);
console.log("Output file path:", outputFilePath);

try {
  const output = ejs.render(template, params);
  // console.log("Rendered output:\n", output);
  fs.writeFileSync(outputFilePath, output);
  console.log("Output written to file successfully.");
} catch (err) {
  console.error("Error:", err);
}
