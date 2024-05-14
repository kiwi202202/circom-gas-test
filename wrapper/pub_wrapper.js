const ejs = require("ejs");
const fs = require("fs");
const path = require("path");

const params = {
  internalInfo: {
    nPublics: 3,
    inputSize: 3,
    publicsBits: [64, 64, 64],
  },
  internalCircuitPath: "../circuits/internal_circuit.circom",
  internalCircuitName: "InternalCircuit",
};

const templatePath = path.join(__dirname, "pub_wrapper.circom.ejs");
const template = fs.readFileSync(templatePath, "utf8");

const outputFilePath = path.join(__dirname, "../circuits/OutputCircuit.circom");

ejs.render(template, params, (err, output) => {
  if (err) {
    console.error("Error rendering the template:", err);
    return;
  }

  console.log(output);
  fs.writeFileSync(outputFilePath, output);
});
