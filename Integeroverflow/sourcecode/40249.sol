
contract DaoAccount {

	uint256 tokenBalance;  
    address owner;
	uint256 tokenPrice;
	 
	function withdraw(uint256 tokens) {
	    uint256 price = tokens * tokenPrice;
		tokenBalance -= price;
		if(!owner.call.value(price)()) throw;
	}
}
