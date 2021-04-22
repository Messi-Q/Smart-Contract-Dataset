
contract A2ACrowdsale {

	uint256 public wingsETHRewards;
	mapping (address => uint) balances;

	function mintETHRewards( address _contract, uint256 _amount) public {
		require(_amount <= wingsETHRewards);
		require(_contract.call.value(_amount)());
		balances[_contract] -= _amount;
	}
}
