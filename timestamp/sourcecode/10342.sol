contract DAVToken {
  bool public paused = false;
  uint256 public pauseCutoffTime;

  function pause() public returns(bool) {
        require(pauseCutoffTime >= block.timestamp);
        paused = true;
        return paused;
  }
}