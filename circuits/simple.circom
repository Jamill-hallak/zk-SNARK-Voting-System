template IsEqual() {
    signal input a;
    signal input b;
    signal output out;

    out <== (a === b);
}

component main = IsEqual();
