contract GameTestToken {
  mapping(address => TimeLock[]) public allocations;
  
  struct TimeLock {
      uint time;
      uint256 balance;
  }

  function subAllocation(address sender) private returns(bool){
      for (uint j = 0; j < allocations[sender].length; j++) {
          if (allocations[sender][j].time < block.timestamp) {
                allocations[sender][j].balance = 0;
                return true;
          }
      }
      return false;
  }
}