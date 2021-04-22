
contract DaoAccount {

	uint256 tokenBalance;
    address owner;
	address daoChallenge;

	modifier onlyOwner() {
	    if (daoChallenge != msg.sender) throw;
	    _;
	}

	function withdraw(uint256 tokens) onlyOwner {
		tokenBalance -= tokens;
		if(!owner.call.value(tokens)()) throw;
	}
}