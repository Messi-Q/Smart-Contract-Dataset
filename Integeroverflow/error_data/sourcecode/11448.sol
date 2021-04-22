contract SuperCountriesEth {
    uint256 private potVersion = 1;
    uint256 private timestampLimit = 1528108990;

	function updateTimestampLimit() internal {
		timestampLimit = block.timestamp + (potVersion * (28800));
		return;
	}
}