contract SEEDCrowdsale {
  uint256 public phase2StartTime;
  uint256[6] public phase2Rates;
  uint256[6] public phase2RateOffsets;

  function getRate() public view returns (uint256) {
    uint offset = block.timestamp - (phase2StartTime);
    for (uint256 i = 0; i < phase2RateOffsets.length; i++) {
      if (offset < phase2RateOffsets[i]) {
        return phase2Rates[i];
      }
    }
    return 0;
  }
}