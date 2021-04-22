contract MineralFactory {
    uint32 public oresLeft;

    function _getRandomMineralId() private view returns (uint32) {
        return uint32(uint256(keccak256(block.timestamp, block.difficulty)) % oresLeft);
    }
}