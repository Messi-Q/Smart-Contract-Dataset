
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

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Crowdsale {
  using SafeMath for uint;
  uint public startsAt;

  function getCurrentFgcCap() public constant returns (uint) {
    uint timeSinceStart = block.timestamp.sub(startsAt);
    uint currentPeriod = (timeSinceStart / 1 days).add(1);

    if (currentPeriod < 2) {
        return currentPeriod.mul(10);
    }
    return 0;
  }
}