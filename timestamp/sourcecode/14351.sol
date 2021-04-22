contract Serpent {
	mapping (address => uint256) public investorReturn;
	uint256 public SerpentCountDown;

	function CollectReturns () external {
		uint256 currentTime = uint256(block.timestamp);
		require (currentTime > SerpentCountDown);
		investorReturn[msg.sender] = 0;
		return;
	}
}