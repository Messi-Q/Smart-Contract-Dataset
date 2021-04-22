contract DVPlock {
  uint256 public releaseTime;
  
  function release() public returns (bool) {
    require(block.timestamp >= releaseTime);
    return true;
  }

  function setTime() public returns (uint256) {
    releaseTime = block.timestamp;
    return releaseTime;
  }
}