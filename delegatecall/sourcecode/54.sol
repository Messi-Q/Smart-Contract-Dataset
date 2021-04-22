contract LifMarketValidationMechanism {

 uint256 public startTimestamp;

  function getCurrentPeriodIndex() public constant returns(uint256) {
    assert(block.timestamp >= startTimestamp);
    return startTimestamp;
  }
}