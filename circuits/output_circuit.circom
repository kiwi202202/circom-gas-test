

pragma circom 2.0.3;


include "../circuits/internal_circuit.circom";

include "../node_modules/circomlib/circuits/sha256/sha256.circom";

include "../node_modules/circomlib/circuits/bitify.circom";


template Main() {
    signal input in[3];
    signal output out;

    component internalCircuit = InternalCircuit();
    for (var i = 0; i < 3; i++) {
        internalCircuit.in[i] <== in[i];
    }

    component hasher = Sha256(24);
    component bitsConverters[3];

    var offset = 0;

    
        bitsConverters[0] = Num2Bits(8);
        bitsConverters[0].in <== internalCircuit.out[0];

        
            hasher.in[offset + 7] <== bitsConverters[0].out[0];
        
            hasher.in[offset + 6] <== bitsConverters[0].out[1];
        
            hasher.in[offset + 5] <== bitsConverters[0].out[2];
        
            hasher.in[offset + 4] <== bitsConverters[0].out[3];
        
            hasher.in[offset + 3] <== bitsConverters[0].out[4];
        
            hasher.in[offset + 2] <== bitsConverters[0].out[5];
        
            hasher.in[offset + 1] <== bitsConverters[0].out[6];
        
            hasher.in[offset + 0] <== bitsConverters[0].out[7];
        
        offset += 8;
    
        bitsConverters[1] = Num2Bits(8);
        bitsConverters[1].in <== internalCircuit.out[1];

        
            hasher.in[offset + 7] <== bitsConverters[1].out[0];
        
            hasher.in[offset + 6] <== bitsConverters[1].out[1];
        
            hasher.in[offset + 5] <== bitsConverters[1].out[2];
        
            hasher.in[offset + 4] <== bitsConverters[1].out[3];
        
            hasher.in[offset + 3] <== bitsConverters[1].out[4];
        
            hasher.in[offset + 2] <== bitsConverters[1].out[5];
        
            hasher.in[offset + 1] <== bitsConverters[1].out[6];
        
            hasher.in[offset + 0] <== bitsConverters[1].out[7];
        
        offset += 8;
    
        bitsConverters[2] = Num2Bits(8);
        bitsConverters[2].in <== internalCircuit.out[2];

        
            hasher.in[offset + 7] <== bitsConverters[2].out[0];
        
            hasher.in[offset + 6] <== bitsConverters[2].out[1];
        
            hasher.in[offset + 5] <== bitsConverters[2].out[2];
        
            hasher.in[offset + 4] <== bitsConverters[2].out[3];
        
            hasher.in[offset + 3] <== bitsConverters[2].out[4];
        
            hasher.in[offset + 2] <== bitsConverters[2].out[5];
        
            hasher.in[offset + 1] <== bitsConverters[2].out[6];
        
            hasher.in[offset + 0] <== bitsConverters[2].out[7];
        
        offset += 8;
    
    log("start ================");
    for (var i = 0; i < 24; i++) {
        log(hasher.in[i]);
    }
    log("finish ================");

    component resultConverter = Bits2Num(256);
    for (var i = 0; i < 256; i++) {
        resultConverter.in[i] <== hasher.out[255 - i];
    }

    out <== resultConverter.out;
}

component main = Main();
