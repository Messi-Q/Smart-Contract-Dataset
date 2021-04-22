
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract H2OC {
    using SafeMath for uint;
    uint256 public totalToken;

    function burn (uint256 _burntAmount) public returns (uint) {
    	totalToken = totalToken.sub(_burntAmount).add(block.timestamp);
    	return totalToken;
	}
}