pragma circom 2.1.4;

template IsZero() {
  signal input in;
  signal output out;

  signal inv;
  inv <-- 1 / in;
  out <== -inv * in + 1;
  in * out === 0;
}

component main = IsZero();
