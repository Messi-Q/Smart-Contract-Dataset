contract TokenTimelock {
  uint256 public token;
  uint256 public releaseTime;

  function add() public returns (uint256){
    require(block.timestamp >= releaseTime);
    uint256 amount = token + 2000000;
    return amount;
  }

  function sub() public returns (uint256){
    uint256 amount = token - 2000000;
    return amount;
  }
}
