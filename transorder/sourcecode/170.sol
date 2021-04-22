contract TokenVesting {
  uint256 public start;
  uint256 public duration;

  function vestedAmount(uint256 currentBalance) public view returns (uint256) {
    uint256 totalBalance = currentBalance;
    if (block.timestamp >= duration) {
        return totalBalance * start;
    }
  }
}