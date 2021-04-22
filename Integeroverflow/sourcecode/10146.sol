contract KOIOSTokenSale {
	uint256 public startingTimestamp = 1518696000;

	function isValidPurchase() internal constant returns (bool) {
		bool validTimestamp = startingTimestamp <= block.timestamp;
		return validTimestamp;
	}
}