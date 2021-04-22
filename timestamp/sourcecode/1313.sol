contract TokenTimelock {
  uint256 public token;
  uint256 public releaseTime;

  function release() public returns (uint256){
    require(block.timestamp >= releaseTime);
    uint256 amount = token * 2;
    require(amount > 0);
    return amount;
  }
}
