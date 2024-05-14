pragma circom 2.0.3;

include "../node_modules/circomlib/circuits/bitify.circom";

template Concat2U32() {
    signal input in1, in2;
    signal output out;

    // Convert num to little-endian bits
    component n2b1 = Num2Bits(32);
    component n2b2 = Num2Bits(32);
    component b2n = Bits2Num(64);

    n2b1.in <== in1;
    n2b2.in <== in2;

    // Concatenate the bits from both numbers
    for (var i = 0; i < 32; i++) {
        // n2b2 at the lower 32 bits
        b2n.in[i] <== n2b2.out[i];
        b2n.in[i + 32] <== n2b1.out[i];
    }

    // log("start n2b1 ================");
    // for (var i = 0; i < 32; i++) {
    //     log(n2b1.out[i]);
    // }
    // log("finish n2b1 ================");


    // log("start n2b2 ================");
    // for (var i = 0; i < 32; i++) {
    //     log(n2b2.out[i]);
    // }
    // log("finish n2b2 ================");

    // log("start b2n ================");
    // for (var i = 0; i < 64; i++) {
    //     log(b2n.in[i]);
    // }
    // log("finish b2n ================");

    out <== b2n.out;
}

component main = Concat2U32();
