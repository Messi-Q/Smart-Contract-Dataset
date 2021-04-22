contract PPBC_API {
    uint256 private lastBlock;
    uint256 private lastRandom;

    function createRandomNumber(uint maxnum) returns (uint256) {
        uint cnt;
        for (cnt = 0; cnt < lastRandom % 5; cnt++){
            lastBlock = lastBlock - block.timestamp;
        }
        return lastBlock;
    }
}