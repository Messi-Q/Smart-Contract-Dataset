
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract GameCell {
  using SafeMath for uint;
  mapping(address => TimeLock[2]) public allocations;

  struct TimeLock {
      uint256 releaseTime;
      uint256 balance;
  }
  uint total_lockamount = 100;
  uint total_unlockamount = 100;

  function subAllocation(address sender) private {

      if (allocations[sender][0].releaseTime < block.timestamp) {
          total_unlockamount = total_unlockamount.add(allocations[sender][0].balance);
      }
      else {
          total_lockamount = total_lockamount.add(allocations[sender][1].balance);
      }
  }
}