contract KOIOSTokenSale {
	uint256 public startingTimestamp = 1518696000;
    uint256 public endingTimestamp = 0;

	function isValidPurchase() internal constant returns (bool) {
		bool validTimestamp = startingTimestamp <= block.timestamp;
		return validTimestamp;
	}

	function deductionPurchase() internal constant returns (uint) {
		endingTime = block.timestamp + 100;
		return endingTime;
	}
}