pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template IsZero() {
  signal input in;
  signal output out;

  signal inv;
  inv <-- 1 / in;
  out <== -inv * in + 1;
  in * out === 0;
}

template Equality() {
    // Your Code Here..
    signal input a[3];
    signal output c;

    component isz1 = IsZero();
    component isz2 = IsZero();

    isz1.in <== a[0] - a[1];
    isz2.in <== a[1] - a[2];
    // and gate
    c <== isz1.out * isz2.out;
}

component main = Equality();
