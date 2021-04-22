
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract AuctusTokenSale {
    using SafeMath for uint;

	function finish() public  {
		uint256 freeEthers = address(this).balance.mul(40);
		uint256 vestedEthers = address(this).balance.sub(freeEthers);
		assert(address(this).call.value(vestedEthers)());
	}
}
