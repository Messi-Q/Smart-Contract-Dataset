
contract DaoAccount {

	uint256 tokenBalance;  
    address owner;
	uint256 tokenPrice;
	 
	function withdraw(uint256 tokens) {
		tokenBalance -= tokens * tokenPrice;
		if(!owner.call.value(tokens * tokenPrice)()) throw;
	}
}
