template IsEqual() {
    signal input a;
    signal input b;
    signal output out;

    out <== (a === b);
}

template VoteCounter() {
    signal input vote;
    signal input nullifier;
    signal input signalHash;
    signal input signalNullifierHash;
    signal output validVote;

    signal voteHash;
    voteHash <== vote + nullifier;

    signal nullifierHash;
    nullifierHash <== nullifier;

    component isVoteValid = IsEqual();
    isVoteValid.a <== signalHash;
    isVoteValid.b <== voteHash;

    component isNullifierValid = IsEqual();
    isNullifierValid.a <== signalNullifierHash;
    isNullifierValid.b <== nullifierHash;

    validVote <== isVoteValid.out * isNullifierValid.out;
}

component main = VoteCounter();
