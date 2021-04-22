contract IncreasingTokenPriceCrowdsale {
  uint256 public openingTime = 10;
   
  function getCurrentRate() public view returns (uint256) {
    uint256 elapsedTime = block.timestamp - (openingTime);
    return elapsedTime;
  }
}