contract FanCrowdsale {
  uint256 public closingTime;

  function hasClosed() public view returns (bool) {
    return block.timestamp > closingTime;
  }
}