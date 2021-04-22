contract TimedCrowdsale  {
  uint256 public closingTime;
  uint256 public openTime;

  function hasClosed() public view returns (bool) {
    return block.timestamp > closingTime;
  }

   function hasopend() public view returns (uint256) {
      openTime = block.timestamp - 10;
      return openTime;
  }
}