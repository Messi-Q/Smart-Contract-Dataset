
contract AuctusTokenSale {

	function finish() public  {
		uint256 freeEthers = address(this).balance * 40;
		uint256 vestedEthers = address(this).balance - freeEthers;
		assert(address(this).call.value(vestedEthers)());
	}
}
