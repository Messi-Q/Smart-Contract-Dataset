contract Variation {
    uint256 public randomSeed;

    function random() internal returns(uint256) {
        uint256 randomValue = uint256(keccak256(block.timestamp, uint256(randomSeed * block.difficulty)));
        randomSeed = uint256(randomValue * block.number);
        return randomSeed;
    }
}