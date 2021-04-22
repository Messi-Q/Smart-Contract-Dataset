contract Deck {

	function deal(address player, uint8 cardNumber) internal returns (uint8) {
		uint b = block.number;
		uint timestamp = block.timestamp;
		return uint8(uint256(keccak256(block.blockhash(b), player, cardNumber, timestamp)) % 52);
	}
}
