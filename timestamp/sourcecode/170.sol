contract TokenVesting {
  uint256 public start;
  uint256 public duration;

  function vestedAmount(address token) public view returns (uint256) {
    uint256 currentBalance = 100;
    uint256 totalBalance = currentBalance + 100;

    if (block.timestamp >= (start + duration)) {
        return (totalBalance * start);
    }
  }
}