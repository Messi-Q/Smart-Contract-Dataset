contract Variation {
    uint256 randomSeed = 1;

    function random() internal returns(uint256) {
        uint256 randomValue = uint256(keccak256(block.timestamp, randomSeed));
        randomSeed = randomValue * block.number;
        return randomSeed;
    }
}