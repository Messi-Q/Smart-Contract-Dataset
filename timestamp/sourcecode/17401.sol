contract FloraFicTokenCrowdsale {
  uint256 public initialRate;
  uint256 public rate;
  uint256 public openingTime;

  function getCurrentRate() public view returns (uint256) {
    uint256 elapsedTime = block.timestamp - (openingTime);
    uint num_day = uint(elapsedTime) / 86400;
    rate = initialRate - (num_day * (initialRate) / (100));
    return rate;
  }
}