contract TimedCrowdsale {
  uint256 public closingTime;
  uint256 public startingTime;

  function hasClosed() public view returns (bool) {
    return block.timestamp > closingTime;
  }

  function setClosed() public view returns (bool) {
    return startingTime < block.timestamp;
  }
}