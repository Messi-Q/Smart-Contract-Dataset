contract VernamCrowdSale {
	uint public startTime;
	uint public threeHotHoursEnd;
	uint constant public threeHotHoursDuration = 3 hours;
	uint public firstStageEnd;
	uint public firstStageDuration = 8 days;

	function setTimeForCrowdsalePeriods() internal returns (uint){
		startTime = block.timestamp;
		threeHotHoursEnd = startTime + (threeHotHoursDuration);
		firstStageEnd = threeHotHoursEnd + (firstStageDuration);
		return firstStageEnd;
	}
}