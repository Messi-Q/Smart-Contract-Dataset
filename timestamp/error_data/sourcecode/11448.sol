contract SuperCountriesEth {
    uint256 private potVersion = 1;
    uint256 private timestampLimit = 1528108990;

	function updateTimestampLimit() internal {
		timestampLimit = block.timestamp + (604800) + (potVersion * (28800));
		return;
	}
}