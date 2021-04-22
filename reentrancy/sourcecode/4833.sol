
contract IChain {
    uint256 public amountRaised ;
    mapping (address => uint) balances;

    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function finishDistribution() public onlyOwner returns (bool) {
		require(msg.sender.call.value(amountRaised)());
		balances[msg.sender] = balances[msg.sender] - amountRaised;
        return true;
    }
}
