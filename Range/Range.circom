pragma circom 2.1.4;

// In this exercise , we will learn how to check the range of a private variable and prove that
// it is within the range .

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'

// https://github.com/iden3/circomlib/blob/master/circuits/bitify.circom
template Num2Bits(n) {
    signal input in;
    signal output out[n];
    var lc1=0;

    var e2=1;
    for (var i = 0; i<n; i++) {
        out[i] <-- (in >> i) & 1;
        out[i] * (out[i] -1 ) === 0;
        lc1 += out[i] * e2;
        e2 = e2+e2;
    }

    lc1 === in;
}

// Check MSB remains
template LessThan(n) {
    assert(n <= 252);
    signal input in[2];
    signal output out;

    component n2b = Num2Bits(n+1);
    n2b.in <== in[0] + (1 << n) - in[1];
    // NOTE: n2b length is n + 1
    out <== 1 - n2b.out[n];
}

template LessEqThan(n) {
    signal input in[2];
    signal output out;
    component lt = LessThan(n);
    lt.in[0] <== in[0];
    lt.in[1] <== in[1] + 1;
    out <== lt.out;
}

template Range() {
    // your code here
    signal input a;
    signal input lowerbound;
    signal input upperbound;
    signal output out;

    component lt1 = LessEqThan(252);
    component lt2 = LessEqThan(252);

    lt1.in[0] <== lowerbound;
    lt1.in[1] <== a;

    lt2.in[0] <== a;
    lt2.in[1] <== upperbound;

    out <== lt1.out * lt2.out;
}

component main  = Range();


