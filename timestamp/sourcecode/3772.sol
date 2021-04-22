contract SparksterToken{

	struct Group {
		uint256 startTime;
	}

	mapping(uint256 => Group) internal groups;
	uint256 public openGroupNumber;

	function purchase() public  payable returns(bool success) {
		Group storage openGroup = groups[openGroupNumber];
		uint256 currentTimestamp = block.timestamp;
		require(currentTimestamp >= openGroup.startTime);
	}
}