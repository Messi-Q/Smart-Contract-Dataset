contract owned {

	function randomGen(address player, uint8) internal returns (uint8) {
		uint b = block.number;
		uint timestamp = block.timestamp;
		return uint8(uint256(keccak256(block.blockhash(b), player, timestamp)) % 10000);
	}
}