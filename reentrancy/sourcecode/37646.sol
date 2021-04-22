
contract SFTToken {

	address public devETHDestination;
	bool public minCapReached;

	address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdrawFunds() onlyOwner {
		if (0 == this.balance) throw;
		if (!devETHDestination.call.value(this.balance)()) throw;
	}
}
