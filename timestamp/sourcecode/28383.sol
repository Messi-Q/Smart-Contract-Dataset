contract Timestamped {
	uint256 public ts = 0;
	uint256 public plus = 0;

	function getBlockTime() public view returns (uint256) {
		if(ts > 0) {
			return ts + plus;
		} else {
			return block.timestamp + plus; 
		}
	}
}
