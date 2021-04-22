contract RuletkaIo {
    function random() private view returns (uint256) {
        return uint256(uint256(keccak256(block.timestamp, block.difficulty)) % 6);
    }
}