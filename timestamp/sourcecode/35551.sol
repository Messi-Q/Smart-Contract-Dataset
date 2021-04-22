contract MoldCoin {
    uint public endDatetime;
    bool public founderAllocated = false;

    function allocateFounderTokens() {
        require(block.timestamp > endDatetime);
        require(!founderAllocated);
        founderAllocated = true;
        return;
    }
}