contract Lottery {
    uint256 entryCounter;

    function PRNG() internal view returns (uint256) {
        uint256 initialize1 = block.timestamp;
        uint256 calc1 = initialize1 * 5;
        uint256 calc2 = 1 - calc1;
        uint256 PRN = calc2 % entryCounter;
        return PRN;
    }
}