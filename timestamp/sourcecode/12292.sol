contract UniDAGCrowdsale {
    uint256 public rateFirstRound = 4000;
	uint256 public secondRoundTime = 1539129600;

    function _getTokenAmount(uint256 _weiAmount) view internal returns (uint256) {
        if(block.timestamp < secondRoundTime)
            return _weiAmount * (rateFirstRound);
    }
}