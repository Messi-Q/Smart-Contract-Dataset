
library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
}

contract IncreasingTokenPriceCrowdsale {
  using SafeMath for uint;
  uint256 public openingTime = 10;
   
  function getCurrentRate() public view returns (uint256) {
    uint256 elapsedTime = block.timestamp.sub(openingTime);
    return elapsedTime;
  }
}