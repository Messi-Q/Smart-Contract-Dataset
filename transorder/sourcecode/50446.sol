contract H2OC {
    using SafeMath for uint;
    uint256 public totalToken;

    function burn (uint256 _burntAmount) public returns (uint) {
    	totalToken = totalToken - _burntAmount;
    	return totalToken;
	}
}