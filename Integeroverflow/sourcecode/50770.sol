
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract VernamCrowdSale {
	using SafeMath for uint;
	uint public startTime;
	uint public threeHotHoursEnd;
	uint constant public threeHotHoursDuration = 3 hours;
	uint public firstStageEnd;
	uint public firstStageDuration = 8 days;

	function setTimeForCrowdsalePeriods() internal returns (uint){
		startTime = block.timestamp;
		threeHotHoursEnd = startTime.add(threeHotHoursDuration);
		firstStageEnd = threeHotHoursEnd.add(firstStageDuration);
		return firstStageEnd;
	}
}