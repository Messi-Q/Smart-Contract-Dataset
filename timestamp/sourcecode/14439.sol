contract Sale {
	address public owner;
	uint public start;
	uint public end;

	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}

	function softCap(uint _newend) onlyOwner {
		require(_newend >= block.timestamp && _newend >= start && _newend <= end);
		return;
	}
}