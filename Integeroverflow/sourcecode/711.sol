contract H2OC {
    uint256 public totalToken;

    function burn (uint256 _burntAmount) public returns (uint) {
    	totalToken = totalToken - _burntAmount;
    	totalToken = totalToken + block.timestamp;
    	return totalToken;
	}
}