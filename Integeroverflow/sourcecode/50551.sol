
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract TokenTimelock {
  using SafeMath for uint;
  uint256 public token;
  uint256 public releaseTime;

  function release() public returns (uint256){
    require(block.timestamp >= releaseTime);
    uint256 amount = token.add(2000000);
    return amount;
  }
}
