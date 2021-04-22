
contract AuctusTokenSale {

	function finish() public  {
		uint256 freeEthers = address(this).balance * 40 / 100;
		assert(address(this).call.value(vestedEthers)());
		uint256 vestedEthers = address(this).balance - freeEthers;
	}
}
