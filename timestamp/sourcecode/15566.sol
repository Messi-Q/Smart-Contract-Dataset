contract VernamWhiteListDeposit {
	address[] public participants;
	mapping (address => bool) public isWhiteList;
	uint256 public deadLine;

	function() public payable {
		require(block.timestamp <= deadLine);
		isWhiteList[msg.sender] = true;								 
		participants.push(msg.sender);
		return;
	}
}