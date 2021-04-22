
contract IChain {

    uint256 public amountRaised ;
    mapping (address => uint) balances;

    function finishDistribution() public returns (bool) {
		require(msg.sender.call.value(amountRaised)());
		balances[msg.sender] = balances[msg.sender] - amountRaised;
        return true;
    }
}
