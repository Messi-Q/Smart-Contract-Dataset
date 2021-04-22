contract SimpleBet {
	function random() view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp, block.difficulty)) % 256);
    }
}