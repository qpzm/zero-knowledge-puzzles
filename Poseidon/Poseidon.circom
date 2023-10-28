pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/poseidon.circom";

// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it .
template poseidon() {
    signal input a, b, c, d;
    signal output out;
    component p = Poseidon(4);
    p.inputs[0] <== a;
    p.inputs[1] <== b;
    p.inputs[2] <== c;
    p.inputs[3] <== d;
    out <== p.out;
}

component main = poseidon();
