contract GameCell {
  mapping(address => TimeLock[2]) public allocations;

  struct TimeLock {
      uint256 releaseTime;
      uint256 balance;
  }
  uint total_unlockamount = 100;

  function subAllocation(address sender) private {

      if (allocations[sender][0].releaseTime < block.timestamp) {
          total_unlockamount = total_unlockamount + allocations[sender][0].balance;
          assert(total_unlockamount >= allocations[sender][0].balance);
      }
  }
}