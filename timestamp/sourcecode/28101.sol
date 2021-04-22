contract LifMarketValidationMechanism {
  bool public paused = false;
  uint256 public totalPausedSeconds = 0;
  uint256 public pausedTimestamp;

  function unpause() public {
    uint256 pausedSeconds = block.timestamp - (pausedTimestamp);
    totalPausedSeconds = totalPausedSeconds - (pausedSeconds);
    paused = false;
    return;
  }
}