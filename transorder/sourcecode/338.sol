contract TimedCrowdsale {
  uint256 public closingTime;
  uint256 public startingTime;

  function hasClosed() public view returns (bool) {
    return block.timestamp > closingTime;
  }

  function setClosed() public view returns (uint256) {
    closingTime = startingTime + block.timestamp;
    return closingTime;
  }
}