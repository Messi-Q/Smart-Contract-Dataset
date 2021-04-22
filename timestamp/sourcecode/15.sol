contract NXX {

	function addSupportedToken(uint256 _endTime) public returns (bool) {
		require(_endTime > block.timestamp);
		return true;
	}
}