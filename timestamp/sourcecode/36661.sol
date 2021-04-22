contract JesusCrowdsale {
  uint256 constant public START = 1507755600;

  function getRate() constant returns (uint8) {
    if (block.timestamp < START)
        return 166;
    return 120;
  }
}