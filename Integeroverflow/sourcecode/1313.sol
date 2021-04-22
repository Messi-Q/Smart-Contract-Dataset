contract TokenTimelock {
  uint256 public token;
  uint256 public releaseTime;

  function release() public returns (uint256){
    require(block.timestamp >= releaseTime);
    uint256 amount = token * 2000000;
    return amount;
  }
}
