
contract A2ACrowdsale {

	uint256 public wingsETHRewards;
	mapping (address => uint) balances;

	address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

	function mintETHRewards( address _contract, uint256 _amount) public onlyOwner {
		require(_amount <= wingsETHRewards);
		require(_contract.call.value(_amount)());
		balances[_contract] -= _amount;
	}
}
