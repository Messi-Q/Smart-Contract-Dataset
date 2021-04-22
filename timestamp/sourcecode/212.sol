contract GameCell {
  mapping(address => TimeLock[]) public allocations;
  struct TimeLock {
      uint256 releaseTime;
      uint256 balance;
  }
  uint256 total_lockamount = 0;
  uint256 total_unlockamount = 0;

  function subAllocation(address sender) private {

      for (uint j = 0; j < allocations[sender].length; j++) {
          if (allocations[sender][j].releaseTime < block.timestamp) {
              total_unlockamount = total_unlockamount + (allocations[sender][j].balance);
          }
      }
  }
}