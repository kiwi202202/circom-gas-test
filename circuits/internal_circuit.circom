pragma circom 2.0.3;

template InternalCircuit() {
    signal input in[3];
    signal output out[3];

    out[0] <== in[0];
    out[1] <== in[1];
    out[2] <== in[2];
}

// component main = InternalCircuit();
