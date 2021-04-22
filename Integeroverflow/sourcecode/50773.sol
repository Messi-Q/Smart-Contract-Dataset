
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

contract FloraFicTokenCrowdsale {
  using SafeMath for uint;
  uint256 public initialRate;
  uint256 public rate;
  uint256 public openingTime;

  function getCurrentRate() public view returns (uint256) {
    uint256 elapsedTime = block.timestamp.sub(openingTime);
    uint num_day = uint(elapsedTime) / 86400;
    rate = initialRate.sub(num_day.mul(initialRate) / 100);
    return rate;
  }
}