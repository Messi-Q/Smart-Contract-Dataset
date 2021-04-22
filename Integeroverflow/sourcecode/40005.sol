contract PPBC_API {
    uint256 private lastBlock;
    uint256 private lastRandom;
    uint cnt;

    function createRandomNumber() returns (uint256) {
        for (cnt = 0; cnt < lastRandom % 5; cnt++){
            lastBlock = lastBlock - block.timestamp;
        }
        return lastBlock;
    }
}