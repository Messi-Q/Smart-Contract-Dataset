contract braggerContract {
    function random() private view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp, block.difficulty)) % 251);
    }
}