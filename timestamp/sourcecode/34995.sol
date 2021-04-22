contract KingOfTheHill {

	uint public timeLimit = 1 hours;
	uint public lastKing;


	function () external payable {
		require(msg.value == 0.1 ether);
		if ((lastKing + timeLimit) < block.timestamp) {
		    lastKing = 100;
		}
	}

}