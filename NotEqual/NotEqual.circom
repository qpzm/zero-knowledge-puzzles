pragma circom 2.1.4;


// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like .

// HINT:NEGATION
template NonZero() {
    signal input in;
    signal inverse;
    signal output out;
    inverse <-- 1 / in;
    out <== inverse * in;
}

template NotEqual() {
    signal input a[2];
    signal output c;
    component nz = NonZero();
    nz.in <== a[0] - a[1];
    c <== nz.out;
}

component main = NotEqual();
