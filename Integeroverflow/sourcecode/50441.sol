
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract TokenVesting {
  using SafeMath for uint;
  uint256 public start;
  uint256 public duration;

  function vestedAmount(uint256 currentBalance) public view returns (uint256) {
    uint256 totalBalance = currentBalance.add(100);

    if (block.timestamp >= duration) {
        return totalBalance.mul(start);
    }
  }
}