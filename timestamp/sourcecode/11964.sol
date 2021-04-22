contract ERC20Basic {
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
}

contract TokenTimelock {
  ERC20Basic public token;
  uint256 public releaseTime;

  function release() public {
    require(block.timestamp >= releaseTime);
    uint256 amount = token.balanceOf(this);
    require(amount > 0);
    return;
  }
}