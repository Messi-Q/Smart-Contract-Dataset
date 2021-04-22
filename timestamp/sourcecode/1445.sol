contract ERC20Basic {
  function balanceOf(address who) public view returns (uint256);
}

contract TokenVesting {

  ERC20Basic public token;

  uint256 public start;
  uint256 public currentBalance;
  mapping (address => uint256) public released;
  uint256 public totalBalance;

  function vestedAmount() public returns (uint256) {
    currentBalance = token.balanceOf(this);
    totalBalance = currentBalance + (released[token]);

    if (block.timestamp >= start) {
        return totalBalance;
    }
  }
}