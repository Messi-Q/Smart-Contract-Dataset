contract SwarmVotingMVP {

    bytes32 public ballotEncryptionSeckey;
    bool seckeyRevealed = false;
    uint256 public endTime;

    function revealSeckey(bytes32 _secKey) public {
        require(block.timestamp > endTime);
        ballotEncryptionSeckey = _secKey;
        seckeyRevealed = true;
        return;
    }
}