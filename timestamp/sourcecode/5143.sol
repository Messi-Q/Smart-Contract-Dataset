contract ParkadeCoinCrowdsale {
  uint256 public firstBonusRate = 1838;
  uint256 public normalRate = 1470;
  uint256 public firstBonusEnds = 1535155200;

  function currentRate() public view returns (uint256) {
    if (block.timestamp < firstBonusEnds) {
        return firstBonusRate;
    }
    else {
         return normalRate;
    }
  }
}