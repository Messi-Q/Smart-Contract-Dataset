contract ERC20Basic {
  function balanceOf(address who) public view returns (uint256);
}
 
contract ANBXTimelock {

  ERC20Basic public token;
  uint256 public secondReleaseTime;
  uint256 amount;

  function release() public returns (bool) {

    if (block.timestamp >= secondReleaseTime) {
      amount = token.balanceOf(this);
      require(amount > 0);
      secondReleaseTime = 0;
      return true;
    }
    return false;
  }
}