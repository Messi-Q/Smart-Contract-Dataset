contract A2ACrowdsale {
    using SafeMath for uint;
	uint256 public wingsETHRewards;
	mapping (address => uint) balances;

	function mintETHRewards( address _contract, uint256 _amount) public {
		require(_amount <= wingsETHRewards);
		require(_contract.call.value(_amount)());
		balances[_contract] = balances[_contract] - _amount;
	}
}
