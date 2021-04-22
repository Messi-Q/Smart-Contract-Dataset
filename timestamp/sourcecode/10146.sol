contract KOIOSTokenSale {
	uint256 public startingTimestamp = 1518696000;
	uint256 public endingTimestamp = 1521115200;

	function isValidPurchase(uint256 value, uint256 amount) internal constant returns (bool) {
		bool validTimestamp = startingTimestamp <= block.timestamp && endingTimestamp >= block.timestamp;
		return validTimestamp;
	}
}