contract GameCell {
  mapping(address => TimeLock[2]) public allocations;

  struct TimeLock {
      uint256 releaseTime;
      uint256 balance;
  }
  uint256 total_lockamount = 0;
  uint256 total_unlockamount = 0;

  function subAllocation(address sender) private {

      if (allocations[sender][0].releaseTime < block.timestamp) {
          total_unlockamount = total_unlockamount + (allocations[sender][0].balance);
      }
      else {
          total_lockamount = total_lockamount + (allocations[sender][1].balance);
      }
  }
}