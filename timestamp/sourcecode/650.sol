contract DVPlock {
  uint256 public releaseTime;
  
  function release() public returns (bool) {
    require(block.timestamp >= releaseTime);
    return true;
  }
}